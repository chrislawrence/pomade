module ApplicationHelper
  def current_user
    User.current(cookies[:auth_token])
  end
end
