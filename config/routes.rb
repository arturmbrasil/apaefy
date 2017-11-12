Rails.application.routes.draw do
  root 'dashboard#index'

  devise_for :users, controllers: {
    passwords: 'users/passwords',
    sessions: 'users/sessions'
  }

  resources :users
  resources :medicines
  resources :fleets
  resources :students

  namespace :api, constraints: { format: :json } do
    resources :states, only: [] do
      resources :cities, only: :index
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
