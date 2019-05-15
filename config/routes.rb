Rails.application.routes.draw do
  # get 'doses'
  resources :cocktails do
    resources :doses, only: [:index, :create]
  end
end
