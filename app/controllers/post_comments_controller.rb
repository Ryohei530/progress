class PostCommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  
  def create
    @post = PostComment.new(post_comment_params)
    if @post.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_url(params[:post_id])
  end
  
    private
    
    def post_comment_params
      params.require(:post_comment).permit(:content,
                                           :reply_id, 
                                           :post_id).merge(user_id: current_user.id,
                                                           post_id: params[:post_id])
    end
    
    def correct_user
      @user = PostComment.find(params[:id]).user
      redirect_to(root_url) unless current_user?(@user)
    end
end
