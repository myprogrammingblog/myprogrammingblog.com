Rails.application.routes.draw do
  root to: 'notifications#index'

  resources :messages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Websockets resemble this URL
  # mount ActionCable.server => '/cable'
end
