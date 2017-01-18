Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'pages#home'

  post '/subscribe', to: 'pages#subscribe'

  # Routes for core user side
  resources :users, only: [ :show, :edit, :update ] do

    # User Pages
    get 'profile', to: 'users#profile'
    get 'action', to: 'users#action'
    get 'digital', to: 'users#digital'
    get 'proof', to: 'users#proof'
    get 'notes', to: 'users#notes'
    get 'references', to: 'users#references'
    get 'photos', to: 'users#photos'
    get 'video', to: 'users#video'
    resources :call_to_action, controller: 'call_to_action', only: [:index, :new, :create, :edit, :update, :destroy]

    resources :videos

    # Assignee Pages
    resources :assignees do
      get 'notes', to: 'assignees#notes'
      get 'references', to: 'assignees#references'
      get 'photos', to: 'assignees#photos'
      get 'video', to: 'assignees#video'
      resources :notes, only: [:new, :create, :edit, :update, :destroy]
      resources :photos, only: [:new, :create, :edit, :update, :destroy]
      resources :references, only: [:new, :create, :edit, :update, :destroy]
    end

    # Approver Pages
    resources :approvers, controller: 'assignees', type: 'Approver' do
      get 'notes', to: 'assignees#notes'
      get 'references', to: 'assignees#references'
      get 'photos', to: 'assignees#photos'
      get 'video', to: 'assignees#video'
      resources :notes, only: [:new, :create, :edit, :update, :destroy]
      resources :photos, only: [:show, :new, :create, :edit, :update, :destroy]
      resources :references, only: [:new, :create, :edit, :update, :destroy]
    end

    # Guardian Pages
    resources :guardians, controller: 'assignees', type: 'Guardian' do
      get 'notes', to: 'assignees#notes'
      get 'references', to: 'assignees#references'
      get 'photos', to: 'assignees#photos'
      get 'video', to: 'assignees#video'
      resources :notes, only: [:new, :create, :edit, :update, :destroy]
      resources :photos, only: [:show, :new, :create, :edit, :update, :destroy]
      resources :references, only: [:new, :create, :edit, :update, :destroy]
    end

    # Recipient Pages
    resources :recipients, controller: 'assignees', type: 'Recipient' do
      get 'notes', to: 'assignees#notes'
      get 'references', to: 'assignees#references'
      get 'photos', to: 'assignees#photos'
      get 'video', to: 'assignees#video'
      resources :notes, only: [:new, :create, :edit, :update, :destroy]
      resources :photos, only: [:show, :new, :create, :edit, :update, :destroy]
      resources :references, only: [:new, :create, :edit, :update, :destroy]
    end

    # Routes for wizard sign-up
    resources :after_sign_up

  end

end
