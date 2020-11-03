# frozen_string_literal: true

module OauthProvider
  class Delegator

    UnsupportedProvider = Class.new(StandardError)

    attr_reader :omniauth_params

    def initialize(omniauth_params)
      @omniauth_params = omniauth_params
    end

    def provider_service
      @provider_service ||= provider_klass.new(omniauth_params)
    end

    def provider_klass
      case provider
      when 'github'
        OauthProvider::Github
      else
        raise UnsupportedProvider.new("Unsupported Provider: #{provider}")
      end
    end

    def provider
      omniauth_params&.provider
    end

  end
end
