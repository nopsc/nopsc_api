Rails.application.routes.draw do
  resources :mail_subscribers
  resources :signatures
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
