Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :players
  root to: 'players#index'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :players do
        collection do
          get :hall
        end
      end
    end
  end
end
