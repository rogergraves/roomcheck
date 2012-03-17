Roomcheck::Application.routes.draw do
  
  resources :results
<<<<<<< HEAD
=======
  
  # get "results/new"
  # get "results/create"
  # get "results/edit"
  # get "results/update"
  # get "results/destroy"
  # get "results/show"

>>>>>>> c101e7ee5e8296906abdd4414ce8894e01487e5d
  resources :check_lists, :only => [ :index, :new, :edit, :destroy ]
  resources :units, :only => [ :show, :new, :destroy ]
  resources :check_items, :only => [ :new, :edit, :destroy ]

  root :to => 'check_lists#index'
 
end
