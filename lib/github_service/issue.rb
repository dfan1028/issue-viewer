module GithubService
  class Issue < Base

    attr_reader :user, :repository

    def initialize(user, repository)
      @user = user
      @repository = repository
    end

    def import_data!
      issues = prepare_data

      return if issues.empty?

      ::Issue.upsert_all(
        issues,
        unique_by: :remote_id
      )
    end

    private

    def prepare_data
      clean_data.map do |issue|
        {
          title:             issue&.title,
          author:            issue&.user&.login,
          number:            issue&.number,
          repository_id:     repository.id,
          remote_id:         issue&.id,
          remote_created_at: issue&.created_at,
          description:       issue&.body
        }
      end
    end

    def clean_data
      remote_data.reject do |issue|
        issue&.pull_request
      end
    end

    def remote_repository_id
      repository.remote_id&.to_i
    end

    def remote_data
      client.list_issues(remote_repository_id)
    end

  end
end
