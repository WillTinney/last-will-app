Rails.application.routes.draw do

  get 'approvers/index'

  get 'approvers/new'

  get 'approvers/create'

  get 'approvers/edit'

  get 'approvers/update'

  get 'approvers/delete'

  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'pages#home'

  # Routes for core user side
  resources :users, only: [ :show, :edit, :update ] do
    # Routes for wizard sign-up
    resources :after_sign_up
    resources :guardians
  end

end
