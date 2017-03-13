Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
  	namespace :v1 do
      resources :trains, :only => [:index, :show]
      #get "/trains"  => "trains#index"
      #get "/trains/:id" => "trains#show"

    	resources :reservations, :only => [:show, :create, :update, :destroy]
    	#get "/reservations/:id" => "reservations#show"
    	#post "/reservations/:id" => "reservations#create"
    	#patch "/reservations/:id" => "reservations#update"
    	#delete "/reservations/:id" => "reservations#destroy"
  	end
  end

  resources :cities	do
  	member do
  		post :update_temp
  	end
  end
  
end
