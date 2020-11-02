Rails.application.routes.draw do
  root to: "pages#home"

  # Route for Let's Encrypt
  get "/.well-known/acme-challenge/:id" => "pages#lets_encrypt"

  # Static pages
  get "/about", to: "pages#about"
  get "/sponsors", to: "pages#sponsors"
  get "/chapters", to: "pages#chapters"
  get "/bitcoin", to: "pages#bitcoin"
  get '/nonprofit_applications/contract', to: "pages#contract"

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

  get "/nonprofit_applications/contract", to: "nonprofit_applications#contract"

  # Nonprofits
  resources :nonprofit_applications, only: [:new, :edit, :index], controller: "nonprofit_applications" do
    post "save"
    post "submit"
    get "revise"
  end

  resources :nonprofit_interest_forms, only: [:new, :create]

  # Applicants
  resources :student_applications, only: [:new, :create], path: "apply/students"
  # External Applicants
  resources :external_applications, only: [:new, :create], path: "apply/external"
  # Demographic Survey
  resources :demographic_surveys, only: [:new, :create], path: "apply/survey"
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
    resources :demographic_surveys, only: [:index]
  end
end
