Rails.application.routes.draw do
  resources :events
  mount ImageUploader::UploadEndpoint => '/images'
end
