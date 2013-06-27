Pomade::Application.routes.draw do
  controller :static do
    get 'index'
  end
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    post 'logout' => :destroy
  end
  
   get 'edit_profile' => 'users#edit'

  get 'signup' => 'users#new' 

  resources :pomodoros 
  root :to => "application#index"
 controller :users do
   get 'users' => :index
   get '/:id' => :show
  get 'signup' => :new
   get 'users/:id' => redirect('/%{id}')
   get '/edit_profile' => :edit
 end

end 
