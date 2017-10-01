Rails.application.routes.draw do
  resources :medicines do
    get :autocomplete_medicine_nome, on: :collection
  end
  resources :action_plans do
    get :autocomplete_student_nome, on: :collection
  end
  resources :students
  resources :appointments
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
