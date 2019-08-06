Rails.application.routes.draw do
  root to: 'active_test#index'


  get 'active_test/new'
  post 'active_test/create'
  get 'active_test/show'

  get 'question/new'
  get 'question/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
