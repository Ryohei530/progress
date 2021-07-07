class ArticlesController < ApplicationController
  def index
    @articles = Article.page(params[:page])
  end

  def new
    @article = Article.new
    @tags = Tag.all
  end
  
  def create
    @article = current_user.articles.build(article_params)
    tag_list = params[:article][:name].split(nil)
    
    
    if @article.save
      @article.save_tag(tag_list)
      flash[:success] = "記事を投稿しました"
      redirect_to articles_url
    else
      @tags = Tag.all
      render 'new'
    end
  end
  
  def show
    @article = Article.find(params[:id])
    @comment = current_user.article_comments.build
    @comment.article_id = params[:id]
    @article_tags = @article.tags
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "記事が更新されました"
      redirect_to @article
    else
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id]).destroy
    flash[:success] = "記事を削除しました"
    redirect_to articles_url
  end
  
  def tag
    @tags = Tag.all
    @tag = Tag.find(params[:tag_id])
    @articles = @tag.articles.all
  end
  
  def search
    @articles = Article.search(params[:search])
  end
  
    private
    
    def article_params
      params.require(:article).permit(:title, :content)
    end
end
