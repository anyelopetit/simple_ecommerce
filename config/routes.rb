Rails.application.routes.draw do
  resources :payments
  root 'sellers#index'
  resources :sellers do
    resources :products do
      resources :purchases, only: %i[index create] do
        resources :refunds, only: %i[create]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
