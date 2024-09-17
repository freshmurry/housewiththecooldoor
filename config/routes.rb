Rails.application.routes.draw do
  root "pins#index"

  resources :pins do
    resources :comments, only: [:create, :destroy]
  end

  devise_for :users,
             path: '',
             path_names: { sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration' }

  get '/notifications', to: 'notifications#index'

  # Ensure no conflicting routes exist
end
