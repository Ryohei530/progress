class BookmarksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  
  def index
    @bookmarks = current_user.bookmarks
  end
  
  def create
    @article = Article.find(params[:article_id])
    bookmark = @article.bookmarks.build(user_id: current_user.id)
    if bookmark.save
      flash[:success] = "ブックマークしました"
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  def destroy
    @article = Article.find(params[:article_id])
    bookmark = @article.bookmarks.find_by(user_id: current_user.id)
    if bookmark.present?
      bookmark.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  private
    
    def correct_user
      @user = Bookmark.find(params[:id]).user
      redirect_to(root_url) unless current_user?(@user)
    end
end
