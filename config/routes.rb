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
  
  resources :users, :path => 'u' do
    resources :pomodoros
  end

  get 'settings' => 'users#edit'
  get 'signup' => 'users#new'
end 
