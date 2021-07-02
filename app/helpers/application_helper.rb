module ApplicationHelper
  def current_user
    id_token = session[:okta_id_token]
    User.build(id_token) unless id_token.nil?
  end
end
