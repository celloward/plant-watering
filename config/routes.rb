Rails.application.routes.draw do
  root "schedules#index"
  resources :schedules, only: [:index, :show] 
end
