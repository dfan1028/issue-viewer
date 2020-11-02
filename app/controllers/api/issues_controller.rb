class API::IssuesController < ApplicationController

  # before_action :authenticate_user!

  def index
    issues = repository.issues

    # TODO move this into an update method
    unless issues.exists?
      GithubService::Issue.new(current_user, repository).import_data!
    end

    render json: issues#, each_serializer: RepositorySerializer
  end

  def show
    render json: issue
  end

  private

  def issue
    @issue ||= current_user.issues.where(id: params[:id]).first
  end

  def repository
    @repository ||= current_user.repositories.where(id: permitted[:repo_id]).first
  end

  def permitted
    params.permit(:repo_id)
  end

end
