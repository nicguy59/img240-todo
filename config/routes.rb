Rails.application.routes.draw do
  resources :tasks, except: [:edit, :destroy]
  root 'tasks#index'
end
