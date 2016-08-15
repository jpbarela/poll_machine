Rails.application.routes.draw do
  root 'welcome#index'

  resources :sessions, only: [:create, :delete, :new]
  get '/logout', to: 'sessions#delete'
  resources :users, only: [:create, :new, :show]
end
