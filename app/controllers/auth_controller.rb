class AuthController < ApplicationController
  def authenticate
    user = provider_service.create_or_update_user!

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

  def delegator
    @oauth_manager ||= OauthProvider::Delegator.new(omniauth_params)
  end

  def provider_service
    @provider_service ||= delegator.provider_service
  end

  def omniauth_params
    request.env['omniauth.auth']
  end
end
