Namer::Application.routes.draw do
  root 'welcome#index'

  resources :lists, except: [:edit, :update] do
    resources :suggestions, only: [:new, :create] do
      resources :votes, only: [:create]
    end
  end
end
