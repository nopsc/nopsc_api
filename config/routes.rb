Rails.application.routes.draw do
  resources :mail_subscribers
  resources :signatures do
    collection do
      get 'to_csv'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
