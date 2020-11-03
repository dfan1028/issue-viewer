class API::RepositoriesController < API::BaseController

  def index
    filtered =
      current_user
        .repositories
        .page(page)
        .per(per_page_size)

    render json: filtered,
      each_serializer: RepositorySerializer,
      meta: paginate(filtered),
      adapter: :json
  end

end
