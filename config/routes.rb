Rails.application.routes.draw do
  root to: "pages#home"

  # Static pages
  get "/about", to: "pages#about"
  get "/sponsors", to: "pages#sponsors"

  # Devise
  devise_for :admins, controllers: { invitations: "admins/invitations" }
  devise_for :applicants, controllers: { omniauth_callbacks: "applicants/omniauth_callbacks" }

  # Apply
  resource :apply, only: [:show], controller: "apply" do
    get "students"
    get "nonprofits"
  end

  # Projects
  resources :projects, only: [:show, :index]

  # Contact
  resources :contact_forms, only: [:new, :create]

  # Admin
  namespace :admin do
    resource :projects
    resource :dashboard, only: [:show], controller: "dashboard"
    resources :apps, only: [:index]
  end

end
