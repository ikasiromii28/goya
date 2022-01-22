class UsersController < ApplicationController
  before_action :set_user

  def show
    @nickname = @user.nickname
    @posts = @user.posts
    # get_week
  end

  def followings
    @followings = @user.following_users
  end

  def followeds
    @followeds = @user.followed_users
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def get_week
    wdays = ['(日)', '(月)', '(火)', '(水)', '(木)', '(金)', '(土)']

    @todays_date = Date.today - 366
    @week_days = []

    posts = Post.where(date: @todays_date..@todays_date + 366)

    367.times do |x|
      today_posts = []
      posts.each do |post|
        today_posts.push(post.kibun) if post.date == @todays_date + x
      end
      wday_num = Date.today.wday
      wday_num -= 7 if wday_num > 7
      days = { month: (@todays_date + x).month, date: (@todays_date + x).day, wday: (wdays[wday_num]), posts: today_posts }
      @week_days.push(days)
    end
  end
end
