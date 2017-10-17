Rails.application.routes.draw do
  resources :frotas
  resources :action_plans
  resources :medicines
  resources :students
  resources :appointments
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
