Pomade::Application.routes.draw do
  controller :static do
    get 'index'
  end
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    post 'logout' => :destroy
  end
  
  resources :users

  get 'signup' => 'users#new' 

  resources :pomodoros 
  root :to => "application#index"
 
  # Vanity URLS
  get '/:username', :controller => 'users', :action => 'show'
end 
