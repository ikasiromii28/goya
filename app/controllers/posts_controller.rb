class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    get_week
    @post = Post.new
  end

  def create
    get_week
    @post = Post.new(post_params)
    if @post.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  def timeline
    @followings = current_user.followed_users
    @followings.each do |user|
      @following_user_posts = Post.where(user_id: user.id)
      @current_user_posts = Post.where(user_id: current_user.id)
    end
    @posts = (@following_user_posts + @current_user_posts).sort_by { |record| record.date }.reverse!
  end

  private

  def post_params
    params.require(:post).permit(:kibun, :date, :created_at).merge(user_id: current_user.id)
  end

  def get_week
    wdays = ['(日)', '(月)', '(火)', '(水)', '(木)', '(金)', '(土)']

    @todays_date = Date.today - 6
    @week_days = []

    posts = Post.where(date: @todays_date..@todays_date + 6)

    7.times do |x|
      today_posts = []
      posts.each do |post|
        today_posts.push(post) if post.date == @todays_date + x
      end
      wday_num = Date.today.wday
      wday_num -= 7 if wday_num > 7
      days = { month: (@todays_date + x).month, date: (@todays_date + x).day, wday: (wdays[wday_num]), posts: today_posts }
      @week_days.push(days)
    end
  end
end
