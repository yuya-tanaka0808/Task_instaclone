Rails.application.routes.draw do
  resources :favorites, only: [:create, :destroy]
  get 'users/:id/favorites', to: 'users#favorites'
  resources :contacts
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :update, :edit, :show, :destroy]
  resources :pictures do
    collection do
      post :confirm
    end
  end
  root to: "sessions#new"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
