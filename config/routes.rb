Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pets do
    resources :bookings, except: %i[index destroy] do
      resources :review, except: %i[index destroy]
    end
  end

end
