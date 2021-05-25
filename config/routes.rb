Rails.application.routes.draw do
  root to: 'comments#index'
  resources :comments do
    member do
      get :new_reply
      post :reply
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
