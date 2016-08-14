Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:create, :new, :show]

end
