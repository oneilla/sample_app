SampleApp::Application.routes.draw do
  resources :users

  match '/contact', :to => 'static_pages#contact'
  match '/about',   :to => 'static_pages#about'
  match '/help',    :to => 'static_pages#help'
  match '/signup',  :to => 'users#new'
  root :to => 'static_pages#home'
end
