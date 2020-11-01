class AuthController < ApplicationController
  def create
    user = oauth_manager.create_or_update_user!

    session[:user_id] = user.id

    redirect_to :root
  end

  def failure
    redirect_to :root
  end

  def logout
    session[:user_id] = nil

    redirect_to :root
  end

  private

  def oauth_manager
    @oauth_manager ||= OauthProvider::Manager.new(omniauth_params)
  end

  def omniauth_params
    request.env['omniauth.auth']
  end
end
