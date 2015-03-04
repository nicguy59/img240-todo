Rails.application.routes.draw do
  resources :tasks, except: [:edit]
  root 'tasks#index'
end
