require 'rails_helper'

RSpec.describe 'the studio index' do
  it 'lists all studios with names of movies from the studio' do
    warner = Studio.create(name: 'Warner Bros', location: 'Burbank, CA')
    inception = Movie.create(title: 'Inception', creation_year: 2010, genre: 'Action', studio_id: warner.id)
    matrix = Movie.create(title: 'The Matrix', creation_year: 1999, genre: 'Sci-Fi', studio_id: warner.id)
    goodfellas = Movie.create(title: 'Goodfellas', creation_year: 1990, genre: 'Drama', studio_id: warner.id)

    universal = Studio.create(name: 'Universal Studios', location: 'Universal City, CA')
    minions = Movie.create(title: 'Minions', creation_year: 2015, genre: 'Family', studio_id: universal.id)
    jurassic = Movie.create(title: 'Jurassic Park', creation_year: 1993, genre: 'Action', studio_id: universal.id)
    jaws = Movie.create(title: 'Jaws', creation_year: 1975, genre: 'Horror', studio_id: universal.id)

    columbia = Studio.create(name: 'Columbia', location: 'Culver City, CA')
    superbad = Movie.create(title: 'Superbad', creation_year: 2007, genre: 'Comedy', studio_id: columbia.id)
    misery = Movie.create(title: 'Misery', creation_year: 1990, genre: 'Horror', studio_id: columbia.id)
    smurfs = Movie.create(title: 'Smurfs', creation_year: 2011, genre: 'Family', studio_id: columbia.id)

    visit '/studios'

    within '#studios-0' do
      expect(page).to have_content('Name: Warner Bros')
      expect(page).to have_content('Location: Burbank, CA')
      expect(page).to_not have_content('Universal Studios')
      expect(page).to_not have_content('Columbia')
      expect(page).to have_content('Movie Title: Inception')
      expect(page).to have_content('Movie Title: The Matrix')
      expect(page).to have_content('Movie Title: Goodfellas')
    end

    within '#studios-1' do
      expect(page).to have_content('Name: Universal Studios')
      expect(page).to have_content('Location: Universal City, CA')
      expect(page).to_not have_content('Warner Bros')
      expect(page).to_not have_content('Columbia')
      expect(page).to have_content('Movie Title: Minions')
      expect(page).to have_content('Movie Title: Jurassic Park')
      expect(page).to have_content('Movie Title: Jaws')
    end

    within '#studios-2' do
      expect(page).to have_content('Name: Columbia')
      expect(page).to have_content('Location: Culver City, CA')
      expect(page).to_not have_content('Universal Studios')
      expect(page).to_not have_content('Warner Bros')
      expect(page).to have_content('Movie Title: Superbad')
      expect(page).to have_content('Movie Title: Misery')
      expect(page).to have_content('Movie Title: Smurfs')
    end
  end
end
