class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @post = current_user.posts.build
    end
    
    @feed_items = Post.all.page(params[:page])
  end

  def rank
    users = User.includes(:running_days)
    @rank_rdays = users.filter_map { |user| user.running_days.last }
    @rank_rdays.sort_by! { |rank_rday| -rank_rday[:r_days] }
  end

end
