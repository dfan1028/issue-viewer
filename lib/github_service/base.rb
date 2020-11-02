module GithubService
  class Base

    def rate_limit_remaining
      client.rate_limit.remaining
    end

    def access_token
      user.auth_token
    end

    def client
      @client ||= Octokit::Client.new(access_token: access_token)
    end

  end
end
