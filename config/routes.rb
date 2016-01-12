Rails.application.routes.draw do
  root 'nicks#index'
  get 'nicks/create'

  resources :games, only: :show, path: '' do
    resources :races, only: :show, path: ''
  end

end
