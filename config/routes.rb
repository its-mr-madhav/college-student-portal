Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations], controllers: {sessions: 'users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  
  resources :home
  resources :users
  resources :departments
  resources :semesters
  resources :subjects
  resources :faculty_subjects
end
