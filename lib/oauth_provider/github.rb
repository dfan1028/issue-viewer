module OauthProvider
  class Github < Base
    def create_or_update_user!
      User.find_or_initialize_by(uid: uid, platform: provider).tap do |user|
        user.name       = username
        user.email      = email
        user.image_url  = image_url
        user.auth_token = auth_token

        if !user.persisted? || user.changed?
          user.save
        end
      end
    end

    def image_url
      info&.image
    end

    def email
      info&.email
    end

    def username
      info&.nickname
    end

    def auth_token
      omniauth_params&.credentials&.token
    end
  end
end
