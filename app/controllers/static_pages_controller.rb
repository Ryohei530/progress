class StaticPagesController < ApplicationController
  def home
    if logged_in?
    @post = current_user.posts.build
    @feed_items = current_user.feed.page(params[:page])
    end
  end

  def rank
    users = User.includes(:running_days)
    @rank_rdays = users.map { |user| user.running_days.last }
    @rank_rdays.sort_by! { |rank_rday| -rank_rday[:r_days] }
  end

end
