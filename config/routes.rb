Rails.application.routes.draw do
  root to: "pages#home"
  get "/about", to: "pages#about"
  get "/sponsors", to: "pages#sponsors"

  devise_for :users, controllers: { invitations: "users/invitations" }

  resources :contact_forms, only: [:new, :create]

  namespace :admin do
    resource :dashboard, only: [:show], controller: "dashboard"
  end

  resource :apply, only: [:show], controller: "apply" do
    get "students"
    get "nonprofits"
  end

  resource :projects, only: [:show]
end
