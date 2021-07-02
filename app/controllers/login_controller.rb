class LoginController < ApplicationController
  def create
    authorize_params = OktaOauth.authorize_params(prompt: params[:prompt]&.to_s)
    session[:oauth_state] = authorize_params.state
    redirect_to authorize_params.redirect_url
  end

  def error; end

  def callback
    if error_response? || !session_match_state?
      redirect_to(login_error_path)
      return
    end

    setup_session
    redirect_to bucks_new_url
  end

  def clear
    session.clear
    render plain: 'OK'
  end

  private

  def error_response?
    return unless params[:error]

    Rollbar.error(params[:error], error_description: params[:error_description])
    true
  end

  def session_match_state?
    params[:state] == session[:oauth_state]
  end

  def setup_session
    okta_token = OktaOauth.exchange_code(params[:code].to_s)
    session[:okta_access_token] = okta_token.access_token
    session[:okta_expires_at] = okta_token.expires_at.to_i
  end
end
