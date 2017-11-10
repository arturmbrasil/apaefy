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
