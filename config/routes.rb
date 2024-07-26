Rails.application.routes.draw do
  resources :tenants
  # Resources for rooms and room types
  resources :room_types
  resources :rooms
 

  # Health check route for verifying the application status
  get "up" => "rails/health#show", as: :rails_health_check
end
