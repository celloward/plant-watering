Rails.application.routes.draw do
  root "schedules#show"
  resources :schedules, only: [:index, :show] 
end
