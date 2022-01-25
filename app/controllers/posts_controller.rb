class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  before_action :get_location, only: :show

  def index
    @post = current_user.posts.build if logged_in?
    @feed_items = Post.all.page(params[:page])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to posts_url
    else
      @feed_items = Post.all.page(params[:page])
      render 'static_pages/home'
    end
  end

  def show
    @post = Post.find(params[:id])
    @avatar = @post.user.avatar.variant(gravity: :center, resize: "60x60^", crop: "60x60+0+0").processed
    @name = @post.user.name
    @images = @post.images
    @comment_counts = @post.post_comments.count
    @like_counts = @post.post_likes.count
    @comment = PostComment.new
    @comments = PostComment.includes(:user).where(post_id: params[:id], reply_id: nil)
    # @replies = PostComment.includes(:user).where(post_id: params[:id]).where.not(reply_id: nil)
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_back_or posts_url
  end

  private

    def post_params
      params.require(:post).permit(:content, images: [])
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to posts_url if @post.nil?
    end
end
