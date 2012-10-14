SampleApp::Application.routes.draw do
#  get "sessions/new"

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :sessions, :only => [:new, :create, :destroy]
  resources :microposts, :only => [:create, :destroy]
  resources :relationships, :only => [:create, :destroy]

  match '/contact', :to => 'static_pages#contact'
  match '/about',   :to => 'static_pages#about'
  match '/help',    :to => 'static_pages#help'
  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  root :to => 'static_pages#home'
end
