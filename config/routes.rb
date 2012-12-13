ThreadsApp::Application.routes.draw do

  devise_for :users

  resources :projects
  resources :messages do
    member do
      get :star
      get :unstar
    end
  end
  resources :message_threads, path: :threads

  root to: "info#index"

end
