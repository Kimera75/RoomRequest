Rails.application.routes.draw do
  root 'asistants#index'



  resources :events
  resources :requests
  resources :asistants
end
