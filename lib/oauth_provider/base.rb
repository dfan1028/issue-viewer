module OauthProvider
  class Base

    attr_reader :omniauth_params

    def initialize(omniauth_params)
      @omniauth_params = omniauth_params
    end

    def create_or_update_user!
      user.tap do |usr|
        usr.assign_attributes(updatable_params)

        if !usr.persisted? || usr.changed?
          usr.save
        end
      end
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

    def user
      @user ||= User.find_or_initialize_by(uid: uid, platform: provider)
    end

  end
end
