module OauthProvider
  class Github < Base

    def updatable_params
      {
        name: username,
        email: email,
        image_url: image_url,
        auth_token: auth_token
      }
    end

    private

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
