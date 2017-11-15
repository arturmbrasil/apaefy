Rails.application.routes.draw do
  resources :student_appointments
  root 'dashboard#index'

  devise_for :users, controllers: {
    passwords: 'users/passwords',
    sessions: 'users/sessions'
  }

  get '/users/relatorio', to: 'users#relatorio'
  resources :users do
    collection do
      get 'generate', to: 'users#generate', constraints: {format: 'xlsx'}
    end
  end
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

  get '/projetos/relatorio', to: 'projetos#relatorio'
  resources :projetos do
    collection do
      get 'generate', to: 'projetos#generate', constraints: {format: :xlsx}
    end
  end
  resources :colaboradors
  get '/fornecedors/relatorio', to: 'fornecedors#relatorio'
  resources :fornecedors do
    collection do
      get 'generate', to: 'fornecedors#generate', constraints: {format: :xlsx}
    end
  end
  get '/voluntarios/relatorio', to: 'voluntarios#relatorio'
  resources :voluntarios do
    collection do
      get 'generate', to: 'voluntarios#generate', constraints: {format: :xlsx}
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
