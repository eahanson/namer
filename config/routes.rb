Namer::Application.routes.draw do
  root 'welcome#index'

  resources :lists, except: [:edit, :update] do
    resources :suggestions, only: [:new, :create] do
      resources :comments, only: [:new, :create]
      resources :votes, only: [:create]
    end
  end
end
