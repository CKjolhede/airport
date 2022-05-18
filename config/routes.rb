Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/airlines', to: 'airlines#index'
  get '/airlines/new',  to: 'airlines#new'
  get '/airlines/:id', to: 'airlines#show'
  get '/airlines/:id', to: 'airlines#edit'
  post '/airlines', to: 'airlines#create'
  patch '/airlines/:id', to: 'airlines#update'
  delete '/airlines/:id', to: 'airlines#destroy'

  

  get '/airlines/:id/flights', to: 'airline_flights#index'
  get '/airlines/:id/flights/new', to: 'airline_flights#new'
  post '/airlines/:id/flights', to: 'airline_flights#create'
 
  
  get '/flights',       to: 'flights#index'
  get '/flights/new',   to: 'flights#new'
  get '/flights/:id',   to: 'flights#show'
  get '/flights/:id',   to: 'flights#edit'
  post '/flights',      to: 'flights#create'
  patch '/flights/:id', to: 'flights#update'
  delete '/flights/:id',to: 'flights#destroy'
end
