class BoardsController < ApplicationController
  def index
    @board = Board.new
  end
  
  def create
    @board = current_user.boards.build(board_params)
    
    if @board.save
      flash[:success] = "掲示板が作成されました"
      redirect_to boards_url
    else
      render 'index'
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
  end
  
  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      flash[:success] = "更新しました"
      redirect_to @board
    else
      render 'edit'
    end
  end
  
  def destroy
    @board = Board.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to boards_url
  end
  
    private
    
    def board_params
      params.require(:board).permit(:title, :content)
    end
end
