class API::IssuesController < API::BaseController

  def index
    filtered =
      repository
        .issues
        .page(page)
        .per(per_page_size)

    if filtered.total_count.zero?
      GithubService::Issue.new(current_user, repository).import_data!
    end

    render json: filtered,
      each_serializer: IssueSerializer,
      meta: paginate(filtered),
      adapter: :json
  end

  def show
    render json: issue, each_serializer: IssueSerializer
  end

  private

  def issue
    @issue ||=
      current_user
        .issues
        .where(id: params[:id])
        .first
  end

  def repository
    @repository ||=
      current_user
        .repositories
        .where(id: permitted[:repo_id])
        .first
  end

  def permitted
    params.permit(:repo_id)
  end

end
