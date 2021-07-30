class BoardCommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  def create
    @board = BoardComment.new(board_comment_params)
    if @board.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  def destroy
    BoardComment.find(params[:id]).destroy
    redirect_to board_url(params[:board_id])
  end
  
    private
    
    def board_comment_params
      params.require(:board_comment).permit(:content, :reply_id, :board_id).merge(user_id: current_user.id, board_id: params[:board_id])
    end
    
    def correct_user
      @user = BoardComment.find(params[:id]).user
      redirect_to(root_url) unless current_user?(@user)
    end
end
