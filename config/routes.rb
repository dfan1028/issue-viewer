Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'auth#authenticate'
  get '/auth/failure', to: 'auth#failure'
  get '/logout', to: 'auth#logout', as: :auth_logout

  namespace :api, defaults: { format: 'json' } do
    resources :repositories, only: [:index]
    resources :issues, only: [:index, :show]
  end

  root to: 'home#index'

  get '*path', to: 'home#index', constraints: -> (req) do
    !req.xhr? && req.format.html?
  end
end
