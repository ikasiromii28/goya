class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    get_week
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  def timeline
    # #フォローしているユーザーと自分を取得
    # @timeline_users = current_user.followings.all && current_user
    # #フォローユーザーのツイートを表示
    # @posts = @timeline_users.posts.all

    @users = current_user.followeds
    # relationship = Relationship.find_by(followed_id: @user.id, following_id: current_user.id)

    @posts = []
    if @users.present?
      @users.each do |user|
        following_user_posts = Post.where(user_id: user.id).order(created_at: :desc)
        current_user_posts = Post.where(user_id: current_user.id).order(created_at: :desc)
        #取得したユーザーの投稿一覧を@postsに格納
        @posts.concat(following_user_posts)
        @posts.concat(current_user_posts)
      end
    end
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
