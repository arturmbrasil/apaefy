Rails.application.routes.draw do
  resources :funcionarios
  resources :projetos
  resources :colaboradors
  resources :fornecedors
  resources :voluntarios
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
