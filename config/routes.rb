Rails.application.routes.draw do
  get "welcome" => "sessions#welcome"
	get "signin" => "sessions#new"
	resource :session
  root "groups#index"
  get 'signup' => 'users#new'
  resources :users
  #put 'groups/:group_id/complete/tasks' => 'tasks#complete'
  put 'groups/:group_id/complete/:task_id' => 'tasks#complete_single'
	  
  resources :groups do
  	resources :tasks
  end
end
