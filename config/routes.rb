Pomade::Application.routes.draw do
  controller :static do
    get 'index'
  end
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
 
  post 'import' => 'io#import'

  resources :pomodoros 
  root :to => "application#index"
  
  get 'users/me' => 'users#me'
  
  resources :users, :except => ['show','new','edit']
  controller :users do
    get 'settings' => :edit
    get 'signup' => :new
    get '/:id' => :show
    get 'users/:id' => redirect('/%{id}')
  end
  

end 
