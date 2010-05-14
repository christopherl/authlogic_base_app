ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => 'user_sessions', :action => 'new'
  
  map.resources :user_sessions
  
  map.resources :users 
  
  map.resource :account, :only => :show
  
  map.confirmation 'confirmation/:confirmation_code', 
                   :controller   => 'users', 
                   :action       => 'confirm', 
                   :conditions   => {:method => :get}
                   
  map.resources :password_reset_requests, :except => [:index, :show, :destroy]

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
