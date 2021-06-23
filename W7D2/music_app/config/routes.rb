Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only:[:new, :create, :destroy]

  resources :users, only: [:show, :new, :create] do
    get :activate, on: :collection
  end

  resources :bands do
    resources :albums, only: [:new]
  end

end
