Rails.application.routes.draw do
  root to: 'active_test#index'


  namespace :api do
    resources :active_test, only: [:index, :create, :show]
    resources :question, only: [:create]
  
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
