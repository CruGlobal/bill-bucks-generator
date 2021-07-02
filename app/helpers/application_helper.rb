module ApplicationHelper
  def current_user
    session[:okta_access_token]
  end
end
