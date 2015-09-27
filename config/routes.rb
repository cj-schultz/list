Rails.application.routes.draw do
  get "welcome" => "sessions#welcome"
	get "signin" => "sessions#new"
	resource :session
  root "groups#index"
  get 'signup' => 'users#new'
  resources :users
  put 'groups/:group_id/complete/tasks' => 'tasks#complete'
	  
  resources :groups do
  	resources :tasks
  end
end
