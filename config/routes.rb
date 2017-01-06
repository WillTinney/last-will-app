Rails.application.routes.draw do

  get 'admin_refs/index'

  get 'admin_refs/show'

  get 'admin_refs/new'

  get 'admin_refs/create'

  get 'admin_refs/edit'

  get 'admin_refs/update'

  get 'admin_refs/destroy'

  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'pages#home'

  # Routes for core user side
  resources :users, only: [ :show, :edit, :update ] do

    # User profile page
    get 'profile', to: 'users#profile'

    # User call-to-action page
    get 'action', to: 'users#action'

    # User digital assets overview page
    get 'digital', to: 'users#digital'

    # User proof of residency page
    get 'proof', to: 'users#proof'

    # User admin references page
    get 'admin', to: 'users#admin'

    # User photo library page
    get 'photos', to: 'users#photos'

    # User video library page
    get 'videos', to: 'users#videos'

    # Guardian Pages
    resources :guardians do
      get 'notes', to: 'guardians#notes'
      get 'admin', to: 'guardians#admin'
      get 'photos', to: 'guardians#photos'
      get 'videos', to: 'guardians#videos'
      resources :notes, only: [:new, :create, :edit, :update, :destroy]
      resources :photos, only: [:new, :create, :edit, :update, :destroy]
    end

    # Approver Pages
    resources :approvers do
      get 'notes', to: 'approvers#notes'
      get 'admin', to: 'approvers#admin'
      get 'photos', to: 'approvers#photos'
      get 'videos', to: 'approvers#videos'
      resources :notes, only: [:new, :create, :edit, :update, :destroy]
      resources :photos, only: [:new, :create, :edit, :update, :destroy]
    end

    # Recipient Pages
    resources :recipients do
      get 'notes', to: 'recipients#notes'
      get 'admin', to: 'recipients#admin'
      get 'photos', to: 'recipients#photos'
      get 'videos', to: 'recipients#videos'
      resources :notes, only: [:new, :create, :edit, :update, :destroy]
      resources :photos, only: [:new, :create, :edit, :update, :destroy]
    end

    # Routes for wizard sign-up
    resources :after_sign_up

  end

end
