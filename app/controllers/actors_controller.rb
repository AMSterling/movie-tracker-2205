class ActorsController < ApplicationController
  def index
    if params[:search].present?
      @actors = Actor.search(params[:search])
    else
      @actors = Actor.all
    end
  end
end
