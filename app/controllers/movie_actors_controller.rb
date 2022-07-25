class MovieActorsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @actor = Actor.find(params[:actor_id])
    @movie_actor = MovieActor.create!(actor_id: @actor.id, movie_id: @movie.id)

    redirect_to("/movies/#{@movie.id}")
  end
end
