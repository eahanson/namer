Namer::Application.routes.draw do
  root 'welcome#index'

  resources :lists, except: [:edit, :update] do
    resources :suggestions, only: [:new, :create]
  end
end
