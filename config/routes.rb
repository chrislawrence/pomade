Pomade::Application.routes.draw do
  root to: 'home#index'

  namespace :api do
    resources :pomodoros
    resources :users
  end
end
