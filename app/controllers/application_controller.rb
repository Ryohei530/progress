class ApplicationController < ActionController::Base
  include SessionsHelper
  include ReportsHelper
  include UsersHelper
  
  before_action :store_user_location!, if: :storable_location?

  
  private
    
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end
  
    def store_user_location!
      store_location_for(:user, request.fullpath)
    end
    
    def logged_in_user
      unless logged_in?
        store_location
        flash[:alert] = "ログインしてください。"
        redirect_to new_user_session_url
      end
    end
    
    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end
    
end
