Pomade::Application.routes.draw do
  resources :password_resets
    controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
 
  post 'import' => 'io#import'
  get 'io' => 'io#index'

  resources :pomodoros 
  root to:  "application#index"

  get 'users/me' => 'users#me'
  
  resources :users, :except => ['show','new','edit'] do
    resources :pomodoros
  end
  controller :users do
    get 'settings' => :edit, :as => 'settings'
    get 'signup' => :new
    get '/:id' => :show
    get 'users/:id' => redirect('/%{id}')
  end
  

end 
