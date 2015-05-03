Rails.application.routes.draw do
  get 'errors/file_not_found'

  get 'errors/unprocessable'

  get 'errors/internal_server_error'

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

  resources :student_applications, only: [:new, :create], path: "apply/students"
  # Projects
  resources :projects, only: [:show, :index]

  # Contact
  resources :contact_forms, only: [:new, :create]

  # Admin
  namespace :admins, as: :admin do
    resource :dashboard, only: [:show], controller: "dashboard"
    resource :projects
    resources :student_applications, only: [:index] do
      collection { post :import }
    end
    resources :members
    resources :member_roles, only: [:index, :new, :create, :destroy]
    resources :semesters

    resources :final_decisions, shallow: true, only: [] do
      member do
        post :approve
        post :reject
      end
    end
    resource :settings, only: [:show, :edit, :update] do
      post :set_current_semester
    end
  end

  # Errors
  match '/404', to: 'errors#file_not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
