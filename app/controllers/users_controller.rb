class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :destroy]
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  
  def index
    @users = User.page(params[:page]).per(20)
  end
  
  def show
    @user = User.find(params[:id])
    @goal = @user.goal
    @monthly_goal = @user.monthly_goals.last
    @monthly_actions = @user.monthly_goals.last.goal_actions
    @rday_dates = @user.running_days.filter_map { |rday| rday.date }
    @post = @user.posts.first
    @posts = @user.posts
    sum_of_monthly_actions # @sums @monthly_ratio
    sum_of_weekly_actions # @week_sums
    days_of_month # @days_of_month
    days_of_week # @days_of_week, @nth_week
  end

  # def new
  #   @user = User.new
  # end
  
  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     @user.build_goal.save
  #     log_in @user
  #     flash[:success] = "登録が完了しました！"
  #     redirect_to @user
  #   else
  #     render 'new'
  #   end
  # end
  
  def edit
    @user = User.find(params[:id])
  end
  
  # def email
  #   @user = User.find(params[:id])
  # end
  
  # def password
  #   @user = User.find(params[:id])
  # end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールが更新されました"
      redirect_to request.referer
    else
      render 'edit'
      # if request.referer == edit_user_url(@user)
      #   render 'edit'
      # elsif request.referer == email_user_url(@user)
      #   render 'email'
      # elsif request.referer == password_user_url(@user)
      #   render 'password'
      # else
      #   render 'edit'
      # end
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to users_url
  end
  
  def goal 
    @user = User.find(params[:id])
    @goal = @user.goal
  end
  
  def monthly_goal 
    @user = User.find(params[:id])
    @monthly_goals = @user.monthly_goals.all
  end
  
  def report
    @user = User.find(params[:id])
    @reports = @user.reports.page(params[:page])
    @running_day = RunningDay.last
  end
  
  def post
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
  end
  
  def liked_posts
    @user = User.find(params[:id])
    @liked_posts = @user.liked_posts.page(params[:page])
  end
  
  def liked_reports
    @user = User.find(params[:id])
    @liked_reports = @user.liked_reports.page(params[:page])
    @running_day = RunningDay.last
  end
  
    private
      
      def user_params
        params.require(:user).permit(:name, 
                                     :email, 
                                     :bio,
                                     :password,
                                     :password_confirmation, 
                                     :avatar)
      end
      
      def correct_user
        @user = User.find(params[:id])
        
        unless current_user?(@user)
          flash[:alert] = "異なるユーザーのため権限がありません" 
          redirect_to(root_url) 
        end
      end

end