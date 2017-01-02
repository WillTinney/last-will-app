Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'pages#home'

  # Routes for core user side
  resources :users, only: [ :show, :edit, :update ] do

    resources :guardians
    resources :approvers
    resources :recipients

    # Routes for wizard sign-up
    resources :after_sign_up

    # User profile page
    get 'profile', to: 'users#profile'

    # User call-to-action page
    get 'call_to_action', to: 'users#call_to_action'

  end

end
