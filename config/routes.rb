Rails.application.routes.draw do
  resources :student_responsibles
  resources :supplies
  resources :student_appointments
  root 'dashboard#index'

  devise_for :users, controllers: {
    passwords: 'users/passwords',
    sessions: 'users/sessions'
  }

  resources :users
  resources :medicines, only: [:create, :destroy]
  resources :dietary_restrictions, only: [:create, :destroy]
  resources :fleets
  resources :students
  resources :partner_donations, only: [:index, :create, :destroy]
  resources :partners
  resources :products
  resources :projects
  resources :supplies
  resources :student_appointments
  resources :account_pays
  resources :account_receivables

  namespace :api, constraints: { format: :json } do
    resources :states, only: [] do
      resources :cities, only: :index
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
