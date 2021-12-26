module ApplicationHelper
  
  def bg_color
    "bg-login" if %w[new_user_session new_user_registration new_user_password edit_user_password].any? { |name| current_page?(send("#{name}_path")) }
  end
  
  def users_show?
    controller.controller_name == "users" && controller.action_name == "show"
  end
end
