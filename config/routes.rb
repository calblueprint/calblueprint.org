Rails.application.routes.draw do
  root to: "pages#new_home"

  # Route for Let's Encrypt
  get "/.well-known/acme-challenge/:id" => "pages#lets_encrypt"

  # Static pages
  get "/about", to: "pages#about"
  get "/sponsors", to: "pages#sponsors"

  # Devise
  devise_for :admins, controllers: { invitations: "admins/invitations" }
  devise_for :nonprofits

  # Apply
  resource :apply, only: [:show], controller: "apply" do
    get "students"
    get "nonprofits"
  end

  # Newsletter
  post "/newsletter-subscribe", to: "newsletter#subscribe"

  # Nonprofits
  resources :nonprofit_applications, only: [:new, :edit, :index], controller: "nonprofit_applications" do
    post "save"
    post "submit"
    get "revise"
  end

  # Applicants
  resources :student_applications, only: [:new, :create], path: "apply/students"
  # External Applicants
  resources :external_applications, only: [:new, :create], path: "apply/external"
  # Projects
  resources :projects, only: [:show, :index], param: :slug

  # Contact
  resources :contact_forms, only: [:new, :create]

  # Admin
  namespace :admins, as: :admin do
    resources :student_applications, only: [:index, :show]
    get "remaining", to: "student_applications#remaining"

    resources :nonprofit_applications, only: [:show, :index, :destroy]
    resources :semesters
    resources :comparisons, only: [:new, :create]

    resources :admins, only: [:index, :destroy] do
      get "promote"
      get "demote"
    end

    resource :settings, only: [:show, :edit, :update] do
      post :set_current_semester
    end

    resources :external_applications, only: [:index, :show]
  end
end
