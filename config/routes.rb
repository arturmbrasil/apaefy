Rails.application.routes.draw do
  resources :student_appointments
  root 'dashboard#index'

  devise_for :users, controllers: {
    passwords: 'users/passwords',
    sessions: 'users/sessions'
  }

  resources :users
  resources :medicines, only: [:create, :destroy]
  resources :fleets
  resources :students
  resources :partner_donations, only: [:create, :destroy]
  resources :partners

  namespace :api, constraints: { format: :json } do
    resources :states, only: [] do
      resources :cities, only: :index
    end
  end

 resources :addresses
  resources :appointments
  resources :cities
  resources :abastecimentos
  resources :payments
  resources :products
  resources :frotas
  resources :conta_a_pagars
  resources :conta_a_recebers
  resources :doacaos
  resources :parceiros
  resources :action_plans
  resources :medicines
  resources :students
  resources :appointments

  resources :projetos
  resources :colaboradors
  resources :fornecedors
  resources :voluntarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
