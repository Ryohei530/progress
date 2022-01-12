class Api::UsersController < ApplicationController
  
  
  def show
    @user = User.find(params[:id])
    @current_user = current_user
    @goal = @user.goal
    @monthly_goals = @user.monthly_goals.reverse()
    @monthly_goal = @monthly_goals.first
    @monthly_actions = @monthly_goal.goal_actions
    @monthly_actions_array = []
    @monthly_goals.each do |monthly_goal|
      @monthly_actions_array << monthly_goal.goal_actions  
    end
    @rday_dates = @user.running_days.filter_map { |rday| rday.date }
    @post = @user.posts.first
    @posts = @user.posts
    @post_images = []
    @post.images.each do |image|
      @post_images << rails_representation_url(image.variant(resize: "280x180!"))
    end
    @post_images_array =  @posts.map do |post|
                            post.images.map do |image|
                              rails_representation_url(image.variant(resize: "280x180!"))
                            end
                          end
    @post_comment_count = @post.post_comments.count
    @post_comments = PostComment.all
    @like = @post.post_likes.find_by(user_id: current_user.id) if current_user
    @reports = @user.reports
    @report_actions_array = []
    @reports.each do |report|
      @report_actions_array << report.report_actions
    end
    @report_images_array =  @reports.map do |report|
                              report.images.map do |image|
                                rails_representation_url(image.variant(resize: "240x180!"))
                              end
                            end
    @report_comments = ReportComment.all
    @latest_report = @user.monthly_goals.last.reports.where(created_at: Date.today).last
    @latest_report_actions = @latest_report.report_actions if @latest_report.present?
    @avatar_url60 = rails_representation_url(@user.avatar.variant(gravity: :center, resize: "60x60^", crop: "60x60+0+0").processed)
    @avatar_url70 = rails_representation_url(@user.avatar.variant(gravity: :center, resize: "70x70^", crop: "70x70+0+0").processed)
    sum_of_monthly_actions # @sums @monthly_ratios
    sum_of_weekly_actions # @week_sums @day_done @day_date
    days_of_month # @days_of_month
    days_of_week # @days_of_week, @nth_week
  end
end
