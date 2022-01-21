class Api::PostLikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @post = Post.find(params[:post_id])
    @post_likes = @post.post_likes
    @count = @post_likes.count
    @like = @post_likes.find_by(user_id: current_user.id) if current_user
  end

  def create
    @post = Post.find(params[:post_id])
    @post.post_likes.create!(user_id: current_user.id) if current_user
    head :created
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.post_likes.find_by(user_id: current_user.id).destroy! if current_user
    head :ok
  end

  private

    def correct_user
      @user = PostLike.find(params[:id]).user
      redirect_to(root_url) unless current_user?(@user)
    end
end
