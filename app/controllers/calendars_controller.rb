class CalendarsController < ApplicationController
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

  private

  def post_params
    params.require(:post).permit(:kibun, :date)
  end

  def get_week
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']

    @todays_date = Date.today - 27
    @week_days = []

    posts = Post.where(date: @todays_date..@todays_date + 27)

    28.times do |x|
      today_posts = []
      posts.each do |post|
        today_posts.push(post.kibun) if post.date == @todays_date + x
      end
      wday_num = Date.today.wday
      if wday_num > 7
        wday_num = wday_num -7
      end
      days = { month: (@todays_date + x).month, date: (@todays_date + x).day, wday: (wdays[wday_num]), posts: today_posts}
      @week_days.push(days)
    end
  end
end