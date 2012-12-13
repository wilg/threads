ThreadsApp::Application.routes.draw do

  devise_for :users

  resources :projects
  resources :messages
  resources :message_threads, path: :threads

  root to: "projects#index"
  
end
