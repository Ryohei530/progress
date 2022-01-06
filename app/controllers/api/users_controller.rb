class Api::UsersController < ApplicationController
  
  
  def show
    @user = User.find(params[:id])
    @current_user = current_user
    @goal = @user.goal
    @monthly_goal = @user.monthly_goals.last
    @monthly_actions = @user.monthly_goals.last.goal_actions
    @rday_dates = @user.running_days.filter_map { |rday| rday.date }
    @post = @user.posts.first
    @posts = @user.posts
    @report = @user.monthly_goals.last.reports.where(created_at: Date.today).last
    @report_actions = report.report_actions if @report.present?
    @avatar_url60 = rails_representation_url(@user.avatar.variant(gravity: :center, resize: "60x60^", crop: "60x60+0+0").processed)
    @avatar_url70 = rails_representation_url(@user.avatar.variant(gravity: :center, resize: "70x70^", crop: "70x70+0+0").processed)
    sum_of_monthly_actions # @sums @monthly_ratios
    sum_of_weekly_actions # @week_sums @day_done @day_date
    days_of_month # @days_of_month
    days_of_week # @days_of_week, @nth_week
  end
end
