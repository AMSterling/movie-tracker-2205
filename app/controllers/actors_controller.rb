class ActorsController < ApplicationController
  def index
    if params[:search].present?
      @actors = Pet.search(params[:search])
    else
      @actors = Actor.all
    end
  end
end
