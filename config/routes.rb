SampleApp::Application.routes.draw do
  match '/contact', :to => 'statics_pages#contact'
  match '/about',   :to => 'static_pages#about'
  match '/help',    :to => 'static_pages#help'
  root :to => 'static_pages#home'
end
