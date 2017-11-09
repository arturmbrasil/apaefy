Rails.application.routes.draw do
  resources :medicines
  resources :fleets
  resources :students
  root 'dashboard#index'

  devise_for :users, controllers: {
    passwords: 'users/passwords',
    sessions: 'users/sessions'
  }

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
