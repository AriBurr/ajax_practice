Rails.application.routes.draw do
  root 'games#index'
  resources :games, except: [:show, :new, :edit] do
    resources :characters, except: [:edit, :new]
  end
end
