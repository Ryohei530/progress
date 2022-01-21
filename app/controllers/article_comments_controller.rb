class ArticleCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @comment = current_user.article_comments.build(article_comment_params)
    @comment.article_id = params[:article_id]

    if @comment.save
      flash[:success] = "コメントを作成しました"
      redirect_to article_url(Article.find(params[:article_id]))
    else
      render 'articles/show'
    end
  end

  def destroy
    ArticleComment.find(params[:id]).destroy
    redirect_to board_url(params[:article_id])
  end

  private

    def article_comment_params
      params.require(:article_comment).permit(:content)
    end

    def correct_user
      @user = ArticleComment.find(params[:id]).user
      redirect_to(root_url) unless current_user?(@user)
    end
end
