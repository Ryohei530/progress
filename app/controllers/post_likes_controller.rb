class PostLikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  
  def create
    @post = Post.find(params[:post_id])
    like = @post.post_likes.build(user_id: current_user.id)
    if like.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    like = @post.post_likes.find_by(user_id: current_user.id)
    if like.present?
      like.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
    private
    
    def correct_user
      @user = PostLike.find(params[:id]).user
      redirect_to(root_url) unless current_user?(@user)
    end
end
