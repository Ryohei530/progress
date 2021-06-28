class GoalsController < ApplicationController
  def index
  end

  def new
    @goal = current_user.goals.build
    @goal_action = @goal.goal_actions.build
  end

  def create
    @user = current_user
    @goal = @user.goals.build(goal_params)
    if @goal.save
      flash[:success] = "目標を作成しました"
      redirect_to goal_user_url(@user)
    else
      render 'new'
    end
  end

  def show
  end
  
    private
    
    def goal_params
      params.require(:goal).permit(
        :aim, 
        :indicator, 
        :monthly_aim,
        :monthly_indicator, 
        :term_start, 
        :term_end, 
        goal_actions_attributes: [:content, :number, :_destroy, :id]
        )
    end
end
