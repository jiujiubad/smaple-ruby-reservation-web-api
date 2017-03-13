Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, :defaults => { :format => :json } do
  	namespace :v1 do
      #resources :trains, :only => [:index, :show]
      get "/trains"  => "trains#index", :as => :trains
      get "/trains/:train_number" => "trains#show", :as => :train

    	#resources :reservations, :only => [:show, :create, :update, :destroy]
    	get "/reservations/:booking_code" => "reservations#show", :as => :reservation
    	post "/reservations" => "reservations#create", :as => :reservations
    	patch "/reservations/:booking_code" => "reservations#update", :as => :update_reservation
    	delete "/reservations/:booking_code" => "reservations#destroy", :as => :cancel_reservation
  	end
  end

  resources :cities	do
  	member do
  		post :update_temp
  	end
  end
  
end
