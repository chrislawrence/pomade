Pomade::Application.routes.draw do
  root to: 'home#index'

  namespace :api do
    resources :pomodoros, only: :index
  end
end
