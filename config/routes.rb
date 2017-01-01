Rails.application.routes.draw do

  get 'guardians/index'

  get 'guardians/new'

  get 'guardians/create'

  get 'guardians/show'

  get 'guardians/edit'

  get 'guardians/update'

  get 'guardians/destroy'

  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'pages#home'

  # Routes for core user side
  resources :users, only: [ :show, :edit, :update ] do
    # Routes for wizard sign-up
    resources :after_sign_up
  end

end
