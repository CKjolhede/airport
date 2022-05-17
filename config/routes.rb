Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/airlines', to: 'airlines#index'
  get '/airlines/new',  to: 'airlines#new'
  get '/airlines/:id', to: 'airlines#show'

  get '/airlines/:airline_id/flights', to: 'airline_flights#index'
  
  get '/flights', to: 'flights#index'
  get '/flights/:id', to: 'flights#show'
end
