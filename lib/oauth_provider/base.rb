module OauthProvider
  class Base

    attr_reader :omniauth_params

    def initialize(omniauth_params)
      @omniauth_params = omniauth_params
    end

    private

    def info
      omniauth_params&.info
    end

    def uid
      omniauth_params&.uid
    end

    def provider
      omniauth_params&.provider
    end

  end
end
