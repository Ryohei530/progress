class GoalsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @goals = Goal.page(params[:page]).per(20)
  end

  def show
    @goal = Goal.find(params[:id])
  end
  
  def edit
    @goal = Goal.find(params[:id])
  end
  
  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      flash[:success] = "長期目標を設定しました"
      redirect_to root_path
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
        :term_end, 
        )
    end
    
    def correct_user
      @user = Goal.find(params[:id]).user
      redirect_to(root_url) unless current_user?(@user)
    end
end
