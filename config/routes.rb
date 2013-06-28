Pomade::Application.routes.draw do
  controller :static do
    get 'index'
  end
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  
  get 'edit_profile' => 'users#edit'
  get 'signup' => 'users#new' 

  resources :pomodoros 
  root :to => "application#index"
  
  get 'users/me' => 'users#me'
  
  resources :users, :except => 'show'
  controller :users do
   get '/:id' => :show
   get 'users/:id' => redirect('/%{id}')
  end
  

end 
