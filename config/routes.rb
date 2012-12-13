ThreadsApp::Application.routes.draw do

  resources :projects
  resources :messages
  resources :message_threads, path: :threads

  root to: "projects#index"
  
end
