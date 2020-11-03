module GithubService
  class Repository < Base

    attr_reader :user

    def initialize(user)
      @user = user
    end

    def import_data!
      repos = prepare_data

      return if repos.empty?

      ::Repository.upsert_all(
        repos,
        unique_by: :remote_id
      )
    end

    private

    def prepare_data
      remote_data.map do |repo|
        {
          user_id:   user.id,
          full_name: repo&.full_name,
          remote_id: repo&.id
        }
      end
    end

    def remote_data
      client.repos
    end

  end
end
