Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  # scope '(:locale)', locale: /fr/, default:  do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/, defaults: {locale: "en"} do
    root to: 'pages#home'

    devise_for :users, controllers: { registrations: 'registrations', confirmations: 'confirmations' }
    get 'confirm', to: 'pages#confirm'

    get 'about', to: 'pages#about'
    get 'contact', to: 'pages#contact'

    post '/subscribe', to: 'pages#subscribe'


    # Routes for core user side
    resources :users, only: [ :show, :edit, :update ] do

      # User Pages
      get 'profile', to: 'users#profile'
      get 'digital', to: 'users#digital'
      get 'children', to: 'users#children'
      get 'unlock', to: 'users#unlock'
      post 'unlock_data', to: 'users#unlock_data'
      get 'video', to: 'users#video'
      resources :call_to_action, controller: 'call_to_action', only: [:index, :new, :create, :edit, :update, :destroy]

      resources :notes
      resources :photos
      resources :references

      # Assignee Pages
      resources :assignees do
        resources :notes
        resources :photos
        resources :references
      end

      # Approver Pages
      resources :approvers, controller: 'assignees', type: 'Approver' do
        get 'notes', to: 'assignees#notes'
        get 'references', to: 'assignees#references'
        # get 'photos', to: 'assignees#photos'
        get 'video', to: 'assignees#video'
        resources :notes, only: [:index, :new, :create, :edit, :update, :destroy]
        resources :photos, only: [:index, :show, :new, :create, :edit, :update, :destroy]
        resources :references, only: [:index, :show, :new, :create, :edit, :update, :destroy]
      end

      # Guardian Pages
      resources :guardians, controller: 'assignees', type: 'Guardian' do
      resources :notes, only: [:index, :new, :create, :edit, :update, :destroy]
      resources :photos, only: [:index, :show, :new, :create, :edit, :update, :destroy]
      resources :references, only: [:index, :show, :new, :create, :edit, :update, :destroy]
      end

      # Recipient Pages
      resources :recipients, controller: 'assignees', type: 'Recipient' do
        get 'notes', to: 'assignees#notes'
        get 'references', to: 'assignees#references'
        resources :notes, only: [:index, :new, :create, :edit, :update, :destroy]
        resources :photos, only: [:index, :show, :new, :create, :edit, :update, :destroy]
        resources :references, only: [:index, :show, :new, :create, :edit, :update, :destroy]
      end

      # Routes for wizard sign-up
      resources :after_sign_up
    end
  end
end
