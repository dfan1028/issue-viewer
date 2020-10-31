module OauthProvider
  class Manager < Base
    def create_or_update!
      case provider
      when 'github'
        OauthProvider::Github.new(omniauth_params).create_or_update!
      else
        raise "Unsupported Provider: #{provider}"
      end
    end
  end
end
