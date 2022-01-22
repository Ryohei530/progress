class MonthlyGoalsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :get_location, only: :new

  def new
    @monthly_goal = current_user.monthly_goals.build
    @goal_action = @monthly_goal.goal_actions.build
  end

  def create
    @user = current_user
    @monthly_goal = @user.monthly_goals.build(monthly_goal_params)
    if @monthly_goal.save
      flash[:success] = "目標を作成しました"
      redirect_back_or root_url
    else
      render 'new'
    end
  end

  def show
    @monthly_goal = MonthlyGoal.find(params[:id])
    @avatar = @monthly_goal.user.avatar.variant(gravity: :center, resize: "60x60^", crop: "60x60+0+0").processed
  end

  def edit
    @monthly_goal = MonthlyGoal.find(params[:id])
  end

  def update
    @monthly_goal = MonthlyGoal.find(params[:id])
    if @monthly_goal.update(monthly_goal_params)
      flash[:success] = "更新しました"
      redirect_to @monthly_goal
    else
      render 'edit'
    end
  end

  def destroy
    MonthlyGoal.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to goal_user_url(current_user)
  end

  private

    def monthly_goal_params
      params.require(:monthly_goal).permit(
        :monthly_aim,
        :monthly_indicator,
        :term_start,
        :term_end,
        goal_actions_attributes: [:content, :number, :_destroy, :id]
      )
    end

    def correct_user
      @user = MonthlyGoal.find(params[:id]).user
      redirect_to(root_url) unless current_user?(@user)
    end
end
