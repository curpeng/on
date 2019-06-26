Rails.application.routes.draw do
  resources :dealers, only: :index
  root to: 'dealers#index'
end
