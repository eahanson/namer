Namer::Application.routes.draw do
  root 'welcome#index'

  resources :lists, except: [:edit, :update]
end
