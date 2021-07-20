class GoalsController < ApplicationController
  
  def index
    @goals = Goal.page(params[:page]).per(20)
  end

  def new
  end

  def create
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
end
