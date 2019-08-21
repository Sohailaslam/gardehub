Rails.application.routes.draw do
  get '/dashboard',to: "user_panel#index", as: :user_panel

  get 'admin_panel',to: 'admin_panel#index',as: :admin_panel
  get 'admin_panel/users',as: :admin_users
  get '/all_employers', :to => 'admin_panel#all_employers', :as => :all_employers
  get '/all_employees', :to => 'admin_panel#all_employees', :as => :all_employees
  get '/all_instructors', :to => 'admin_panel#all_instructors', :as => :all_instructors

  devise_for :users,:controllers => { sessions: 'users/sessions',registrations: 'users/registrations',passwords: 'users/passwords' }
  root 'home#home'
  get 'admin', to: 'home#admin', as: :admin
  resources :users

  resources :home do
    collection do
      get '/security_guard', :to => 'home#security_guard', :as => :register_security_guard
      get '/instructor', :to => 'home#instructor', :as => :register_instructor
    end
  end

end
