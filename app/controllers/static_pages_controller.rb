class StaticPagesController < ApplicationController
  
  helper_method :resource_name, :resource, :devise_mapping, :resource_class
  
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
  
  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      user.build_goal
    end
    
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end


  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  
  # protected
  
  # def sign_in_params
  #   devise_parameter_sanitizer.sanitize(:sign_in)
  # end
  
  
end
