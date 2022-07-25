Rails.application.routes.draw do
get '/studios', to: 'studios#index'

get '/movies/:id', to: 'movies#show'
post '/movies/:movie_id', to: 'movie_actors#create'

get '/actors', to: 'actors#index'

end
