Rails.application.routes.draw do
  root 'games#index'
  get 'nicks/create'

  resources :games, only: :show, path: '' do
    resources :races, only: :show, path: ''
  end

end
