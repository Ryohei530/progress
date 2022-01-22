class Api::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @current_user = current_user

    @goal = @user.goal

    @monthly_goals = @user.monthly_goals.reverse
    @monthly_goal = @monthly_goals.first
    @monthly_actions = @monthly_goal.goal_actions
    @monthly_actions_array = []
    @monthly_goals.each do |monthly_goal|
      @monthly_actions_array << monthly_goal.goal_actions
    end
    @rday_dates = @user.running_days.filter_map { |rday| rday.date }

    @post = @user.posts.first
    @posts = @user.posts
    @liked_posts = @user.liked_posts # .page(params[:page])
    liked_post_user_ids = @liked_posts.map { |liked_post| liked_post.user_id }
    @liked_post_users = liked_post_user_ids.uniq.map { |user_id| User.find(user_id) }
    @liked_post_users_obj = @liked_post_users.map do |user|
      {
        id: user.id,
        name: user.name,
        image_url: rails_representation_url(user.avatar.variant(gravity: :center, resize: "60x60^", crop: "60x60+0+0").processed)
      }
    end
    @post_images = []
    @post.images.each do |image|
      @post_images << rails_representation_url(image.variant(resize: "280x180!"))
    end
    @post_images_array = @posts.map do |post|
      post.images.map do |image|
        rails_representation_url(image.variant(resize: "280x180!"))
      end
    end
    @liked_post_images_array = @liked_posts.map do |post|
      post.images.map do |image|
        rails_representation_url(image.variant(resize: "280x180!"))
      end
    end
    @post_comment_count = @post.post_comments.count
    @post_comments = PostComment.all
    @like = @post.post_likes.find_by(user_id: current_user.id) if current_user

    @reports = @user.reports
    @liked_reports = @user.liked_reports # .page(params[:page])
    liked_report_user_ids = @liked_reports.map { |liked_report| liked_report.user_id }
    @liked_report_users = liked_report_user_ids.uniq.map { |user_id| User.find(user_id) }
    @liked_report_users_obj = @liked_report_users.map do |user|
      {
        id: user.id,
        name: user.name,
        image_url: rails_representation_url(user.avatar.variant(gravity: :center, resize: "60x60^", crop: "60x60+0+0").processed)
      }
    end
    liked_report_monthly_goals = @liked_report_users.map { |user| user.monthly_goals }
    @liked_report_monthly_goals = liked_report_monthly_goals.flatten
    @liked_report_monthly_actions_array = @liked_report_monthly_goals.map { |monthly_goal| monthly_goal.goal_actions }
    @report_actions_array = @reports.map { |report| report.report_actions.reverse }
    @report_images_array =  @reports.map do |report|
      report.images.map do |image|
        rails_representation_url(image.variant(resize: "240x180!"))
      end
    end
    @liked_report_actions_array = @liked_reports.map { |report| report.report_actions }
    @liked_report_images_array =  @liked_reports.map do |report|
      report.images.map do |image|
        rails_representation_url(image.variant(resize: "240x180!"))
      end
    end
    @report_comments = ReportComment.all
    range = Date.today.beginning_of_day.since(3.hours)..Date.today.end_of_day.since(3.hours)
    @latest_report = @user.monthly_goals.last.reports.where(created_at: range)
    @latest_report_actions = @latest_report[0].report_actions.reverse if @latest_report.present?
    @avatar_url60 = rails_representation_url(@user.avatar.variant(gravity: :center, resize: "60x60^", crop: "60x60+0+0").processed)
    @avatar_url70 = rails_representation_url(@user.avatar.variant(gravity: :center, resize: "70x70^", crop: "70x70+0+0").processed)
    sum_of_monthly_actions # @sums @monthly_ratios
    sum_of_weekly_actions # @week_sums @day_done @day_date
    days_of_month # @days_of_month
    days_of_week # @days_of_week, @nth_week
  end
end
