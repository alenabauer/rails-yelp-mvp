Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    member do
      # get 'restaurants/:id/chef', to: 'restaurants#chef', as: :chef_restaurant
      post :reviews
    end
  end
end
