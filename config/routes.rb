Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users, controllers: { invitations: 'users/invitations' }

  resources :contact_forms, only: [:new, :create]

  namespace :admin do
    resource :dashboard, only: [:show], controller: 'dashboard'
  end
end
