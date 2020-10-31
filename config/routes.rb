Rails.application.routes.draw do
  # namespace :api, defaults: { format: 'json' } do
  #   resources :recipes, only: [:index, :show]
  # end

  root to: 'home#index'

  get '/auth/:provider/callback' => 'auth#create'
  get '/auth/failure', to: "auth#failure"
  get '/logout', to: 'auth#logout', as: :auth_logout

  get '*path', to: 'home#index', constraints: -> (req) do
    !req.xhr? && req.format.html?
  end
end
