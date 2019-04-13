Rails.application.routes.draw do
  devise_for :users, skip: [:registrations], controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  namespace :admin, path: 'admin' do
    resources :users
    resources :users, only: :index do
      member do
        patch :toggle_admin_role
      end
    end
    resources :departments
    resources :semesters
    get '/', to: 'users#index'
  end

  namespace :hod, path: 'hod' do
    resources :users
    resources :subjects
    resources :faculty_subjects
    resources :faculty_subjects, only: :index do
      member do
        get :get_subject
      end
    end
    resources :lectures
    resources :time_tables
    get '/', to: 'users#index'
  end

  namespace :faculty, path: 'faculty' do
    resources :users
    resources :lectures
    get '/', to: 'users#index'
  end

  namespace :student, path: 'student' do
    resources :lectures
    get '/', to: 'lectures#index'
  end
end
