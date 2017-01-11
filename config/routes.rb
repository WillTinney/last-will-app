Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'pages#home'

  # Routes for core user side
  resources :users, only: [ :show, :edit, :update ] do

    # User Pages
    get 'profile', to: 'users#profile'
    get 'action', to: 'users#action'
    get 'digital', to: 'users#digital'
    get 'proof', to: 'users#proof'
    get 'notes', to: 'users#notes'
    get 'admin', to: 'users#admin'
    get 'photos', to: 'users#photos'
    get 'videos', to: 'users#videos'

    # Assignee Pages
    resources :assignees do
      get 'notes', to: 'assignees#notes'
      get 'admin', to: 'assignees#admin'
      get 'photos', to: 'assignees#photos'
      get 'videos', to: 'assignees#videos'
      resources :notes, only: [:new, :create, :edit, :update, :destroy]
      resources :photos, only: [:new, :create, :edit, :update, :destroy]
      resources :references, only: [:new, :create, :edit, :update, :destroy]
    end
    resources :approvers, controller: 'assignees', type: 'Approver' do
      get 'notes', to: 'assignees#notes'
      get 'admin', to: 'assignees#admin'
      get 'photos', to: 'assignees#photos'
      get 'videos', to: 'assignees#videos'
    end
    # Routes for wizard sign-up
    resources :after_sign_up

  end

end
