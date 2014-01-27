class FormatTest
  attr_accessor :mime_type

  def initialize(format)
    @mime_type = Mime::Type.lookup_by_extension(format)
  end

  def matches?(request)
    request.format == mime_type
  end
end

Pomade::Application.routes.draw do
  root to: 'home#index'
  get '*foo', to: 'home#index', :constraints => FormatTest.new(:html)

  namespace :api do
    resources :pomodoros
    resources :users
    resources :sessions
    resources :user_pomodoros
    post :login, to: 'sessions#create'
    delete :logout, to: 'sessions#destroy'
  end
end

