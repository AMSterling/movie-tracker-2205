class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = Actor.search(params[:search]) if params[:search].present?
  end
end
