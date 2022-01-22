class GoalsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :get_location, only: :edit

  def index
    @goals = Goal.page(params[:page]).per(20)
  end

  def show
    @goal = Goal.find(params[:id])
    @avatar = @goal.user.avatar.variant(gravity: :center, resize: "60x60^", crop: "60x60+0+0").processed
    @monthly_goal = @goal.user.monthly_goals.last
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      flash[:success] = "長期目標を設定しました"
      redirect_back_or root_url
    else
      render 'edit'
    end
  end

  private

    def goal_params
      params.require(:goal).permit(
        :aim,
        :indicator,
        :term_start,
        :term_end
      )
    end

    def correct_user
      @user = Goal.find(params[:id]).user
      redirect_to(root_url) unless current_user?(@user)
    end
end
