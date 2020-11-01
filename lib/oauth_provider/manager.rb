module OauthProvider
  class Manager < Base
    def create_or_update_user!
      case provider
      when 'github'
        OauthProvider::Github.new(omniauth_params).create_or_update_user!
      else
        raise "Unsupported Provider: #{provider}"
      end
    end
  end
end
