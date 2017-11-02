Rails.application.routes.draw do

  devise_for :funcionarios, :controllers => { registrations: 'registrations' }
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
  #devise_for :users

  resources :projetos
  resources :colaboradors
  resources :fornecedors
  resources :voluntarios

  devise_scope :funcionario do
    root to: "devise/sessions#new"
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
