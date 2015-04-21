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
  namespace :admins, as: :admin do
    resource :dashboard, only: [:show], controller: "dashboard"
    resource :projects
    resources :student_applications, only: [:index]
    resources :members
    resources :member_roles, only: [:index, :new, :create, :destroy]
    resources :semesters
    resource :settings, only: [:show, :edit, :update] do
      post :set_current_semester
    end
  end
end
