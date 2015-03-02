Rails.application.routes.draw do
  root to: "pages#home"
  get "/about", to: "pages#about"
  get "/sponsors", to: "pages#sponsors"

  devise_for :admins, controllers: { invitations: "admins/invitations", applications: "admins/applications" }
  devise_for :applicants, controllers: { omniauth_callbacks: "applicants/omniauth_callbacks" }

  resources :contact_forms, only: [:new, :create]

  namespace :admins, as: :admin do
    resource :dashboard, only: [:show], controller: "dashboard"
    resource :applications, only: [:show], controller: "app"
  end

  resource :apply, only: [:show], controller: "apply" do
    get "students"
    get "nonprofits"
  end

  resource :projects, only: [:show]
end
