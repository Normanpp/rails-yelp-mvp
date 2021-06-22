Rails.application.routes.draw do
  resources :restaurants, only: %i[new create show index] do
    resources :reviews, only: %i[new create]
  end
end
