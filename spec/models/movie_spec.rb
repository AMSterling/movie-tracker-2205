require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :movie_actors }
    it { should have_many(:actors).through(:movie_actors) }
  end

  describe 'model methods' do
    it 'is the average age of the movies actors' do
      warner = Studio.create!(name: 'Warner Bros', location: 'Burbank, CA')
      inception = Movie.create!(title: 'Inception', creation_year: 2010, genre: 'Action', studio_id: warner.id)
      hardy = Actor.create!(name: 'Tom Hardy', age: 50)
      elliott = Actor.create!(name: 'Ellen Page', age:40)

      matrix = Movie.create!(title: 'The Matrix', creation_year: 1999, genre: 'Sci-Fi', studio_id: warner.id)
      reeves = Actor.create!(name: 'Keanu Reeves', age: 55)

      goodfellas = Movie.create!(title: 'Goodfellas', creation_year: 1990, genre: 'Drama', studio_id: warner.id)

      universal = Studio.create!(name: 'Universal Studios', location: 'Universal City, CA')
      minions = Movie.create!(title: 'Minions', creation_year: 2015, genre: 'Family', studio_id: universal.id)
      jurassic = Movie.create!(title: 'Jurassic Park', creation_year: 1993, genre: 'Action', studio_id: universal.id)
      goldblum = Actor.create!(name: 'Jeff Goldblum', age: 55)

      jaws = Movie.create!(title: 'Jaws', creation_year: 1975, genre: 'Horror', studio_id: universal.id)

      columbia = Studio.create!(name: 'Columbia', location: 'Culver City, CA')
      superbad = Movie.create!(title: 'Superbad', creation_year: 2007, genre: 'Comedy', studio_id: columbia.id)
      misery = Movie.create!(title: 'Misery', creation_year: 1990, genre: 'Horror', studio_id: columbia.id)
      bates = Actor.create!(name: 'Kathy Bates', age: 60)

      smurfs = Movie.create!(title: 'Smurfs', creation_year: 2011, genre: 'Family', studio_id: columbia.id)

      MovieActor.create!(actor_id: reeves.id, movie_id: matrix.id)
      MovieActor.create!(actor_id: bates.id, movie_id: misery.id)
      MovieActor.create!(actor_id: goldblum.id, movie_id: jurassic.id)
      MovieActor.create!(actor_id: elliott.id, movie_id: inception.id)
      MovieActor.create!(movie_id: inception.id, actor_id: hardy.id)

      expect(inception.average_age).to eq(45)
    end
  end
end
