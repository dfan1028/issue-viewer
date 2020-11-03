module Pagination
  DEFAULT_PAGE_SIZE = 10
  MAX_PAGE_SIZE = 100

  def per_page_size
    if params[:per_page].present?
      return MAX_PAGE_SIZE if params[:per_page].to_i > MAX_PAGE_SIZE
      return DEFAULT_PAGE_SIZE if params[:per_page].to_i < 1
      return params[:per_page].to_i
    else
      DEFAULT_PAGE_SIZE
    end
  end

  def paginate(scope)
    {
      current_page:  scope.current_page,
      total_pages:   scope.total_pages
    }
  end

  def page
    params[:page].to_i || 1
  end
end
