class PostLikesController < ApplicationController
  
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
end
