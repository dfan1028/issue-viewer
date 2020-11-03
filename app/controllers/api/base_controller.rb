class API::BaseController < ApplicationController
  include Pagination

  before_action :authenticate_user!
end
