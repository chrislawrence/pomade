Pomade::Application.routes.draw do
  controller :static do
    get 'index'
  end
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    post 'logout' => :destroy
  end

  resources :pomodoros 
  root :to => "application#index"
  
end 
