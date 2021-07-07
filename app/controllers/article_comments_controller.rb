class ArticleCommentsController < ApplicationController
  
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
  
    private
    
    def article_comment_params
      params.require(:article_comment).permit(:content)
    end
end
