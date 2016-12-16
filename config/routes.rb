Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'pages#home'

  # Routes for core user side
  resources :users, only: [ :show, :edit, :update ] do
    # Routes for wizard sign-up
    resources :after_sign_up
  end

end
