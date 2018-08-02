Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/results', to: "pages#results"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pets do
    resources :bookings, except: %i[index destroy] do
      resources :reviews, except: %i[index destroy]
    end
  end

  put 'bookings/:booking_id/accept_booking', to:'bookings#accept_booking', as: :accept_booking
  put 'bookings/:booking_id/reject_booking', to:'bookings#reject_booking', as: :reject_booking
  put 'bookings/:booking_id/cancel_booking', to:'bookings#cancel_booking', as: :cancel_booking
  get 'pets/:pet_id/show_bookings', to:'pets#show_bookings', as: :show_bookings

  resources :bookings, only: :index do
    resources :reviews, only: %i[show new create]
  end

end
