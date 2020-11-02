class API::RepositoriesController < ApplicationController

  # before_action :authenticate_user!

  def index
    repositories = current_user.repositories

    render json: repositories#, each_serializer: RepositorySerializer
  end
end
