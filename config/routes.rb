Rails.application.routes.draw do
  resources :food_restrictions do
    get :autocomplete_food_restriction_restricao, on: :collection
  end
  resources :medicines do
    get :autocomplete_medicine_nome, on: :collection
  end
  resources :action_plans
  resources :students do
    get :autocomplete_student_nome, on: :collection
  end
  resources :appointments
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
