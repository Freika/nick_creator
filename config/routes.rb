Rails.application.routes.draw do
  root 'nicks#index'
  get 'nicks/create'
end
