Todo::Application.routes.draw do
  
  root :to => "home#index"
  
  resources :users
  resources :lists do
    resources :list_items
  end
  resources :user_sessions
  match 'login' =>  'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout



  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
