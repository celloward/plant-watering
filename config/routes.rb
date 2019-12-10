Rails.application.routes.draw do
  root "watering_dates#index"
  resources :watering_dates, only: [:index, :show] 
end
