Rails.application.routes.draw do

  get 'recipients/index'

  get 'recipients/show'

  get 'recipients/new'

  get 'recipients/create'

  get 'recipients/edit'

  get 'recipients/update'

  get 'recipients/destroy'

  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'pages#home'

  # Routes for core user side
  resources :users, only: [ :show, :edit, :update ] do
    # Routes for wizard sign-up
    resources :after_sign_up
    resources :guardians
    resources :approvers
  end

end
