Rails.application.routes.draw do

  resources :abastecimentos
  resources :action_plans
  resources :addresses
  resources :appointments
  resources :cities
  resources :colaboradors
  resources :conta_a_pagars
  resources :conta_a_recebers
  resources :doacaos
  resources :fornecedors
  resources :frotas
  resources :funcionarios
  resources :medicines
  resources :parceiros
  resources :payments
  resources :products
  resources :projetos
  resources :students
  resources :voluntarios

  devise_for :users

  get 'abastecimentos/search' => 'abastecimentos#search'
  get 'funcionarios/search' => 'funcionario#search'
  get 'frotas/search' => 'frotas#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
