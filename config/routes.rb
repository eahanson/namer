Namer::Application.routes.draw do
  root 'welcome#index'

  resources :lists, except: [:edit, :update] do
    resources :suggestions, only: [:new, :create] do
      resources :comments, only: [:new, :create]
      resources :domain_names, only: [:index]
      resources :votes, only: [:create]
    end
  end
end
