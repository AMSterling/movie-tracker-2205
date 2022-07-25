require 'rails_helper'

RSpec.describe 'the movies show page' do
  it 'shows the movie attributes and its actors' do
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


    visit "/movies/#{inception.id}"

    expect(page).to have_content('Title: Inception')
    expect(page).to have_content('Creation Year: 2010')
    expect(page).to have_content('Genre: Action')
    expect(page).to have_content('Actor: Ellen Page')
    expect(page).to have_content('Actor: Tom Hardy')
    expect(page).to_not have_content('The Matrix')
    expect(page).to_not have_content('Superbad')
    expect(page).to_not have_content('Jaws')
    expect(page).to_not have_content('Actor: Kathy Bates')

    visit "/movies/#{minions.id}"

    expect(page).to have_content('Title: Minions')
    expect(page).to have_content('Creation Year: 2015')
    expect(page).to have_content('Genre: Family')
    expect(page).to_not have_content('Jurassic Park')
    expect(page).to_not have_content('Smurfs')
    expect(page).to_not have_content('Goodfellas')

    visit "/movies/#{jurassic.id}"

    expect(page).to have_content('Title: Jurassic Park')
    expect(page).to have_content('Creation Year: 1993')
    expect(page).to have_content('Genre: Action')
    expect(page).to have_content('Actor: Jeff Goldblum')
    expect(page).to_not have_content('Misery')
    expect(page).to_not have_content('The Matrix')
    expect(page).to_not have_content('Jaws')

    visit "/movies/#{matrix.id}"

    expect(page).to have_content('Title: The Matrix')
    expect(page).to have_content('Creation Year: 1999')
    expect(page).to have_content('Genre: Sci-Fi')
    expect(page).to have_content('Actor: Keanu Reeves')
    expect(page).to_not have_content('Misery')
    expect(page).to_not have_content('Inception')
    expect(page).to_not have_content('Jaws')
  end

  it 'shows the actors in the movie' do
    warner = Studio.create!(name: 'Warner Bros', location: 'Burbank, CA')
    matrix = Movie.create!(title: 'The Matrix', creation_year: 1999, genre: 'Sci-Fi', studio_id: warner.id)
    reeves = Actor.create!(name: 'Keanu Reeves', age: 55)

    MovieActor.create!(actor_id: reeves.id, movie_id: matrix.id)

    visit "/movies/#{matrix.id}"
# save_and_open_page
    expect(page).to have_content('Title: The Matrix')
    expect(page).to have_content('Actor: Keanu Reeves')
  end

  it 'shows the actors in order youngest to oldest' do
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

    visit "/movies/#{inception.id}"

    within '#actors-0' do

      expect(page).to have_content('Actor: Ellen Page')
    end

    within '#actors-1' do

      expect(page).to have_content('Actor: Tom Hardy')
    end
  end

  it 'shows the average age of all cast members' do
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

    visit "/movies/#{inception.id}"

    expect(page).to have_content('Average Age of Cast: 45')
  end

  it 'has a form to add an actor to the movie when it shows none' do
    warner = Studio.create!(name: 'Warner Bros', location: 'Burbank, CA')
    inception = Movie.create!(title: 'Inception', creation_year: 2010, genre: 'Action', studio_id: warner.id)
    matrix = Movie.create!(title: 'The Matrix', creation_year: 1999, genre: 'Sci-Fi', studio_id: warner.id)
    goodfellas = Movie.create!(title: 'Goodfellas', creation_year: 1990, genre: 'Drama', studio_id: warner.id)

    universal = Studio.create!(name: 'Universal Studios', location: 'Universal City, CA')
    minions = Movie.create!(title: 'Minions', creation_year: 2015, genre: 'Family', studio_id: universal.id)
    jurassic = Movie.create!(title: 'Jurassic Park', creation_year: 1993, genre: 'Action', studio_id: universal.id)
    jaws = Movie.create!(title: 'Jaws', creation_year: 1975, genre: 'Horror', studio_id: universal.id)

    columbia = Studio.create!(name: 'Columbia', location: 'Culver City, CA')
    superbad = Movie.create!(title: 'Superbad', creation_year: 2007, genre: 'Comedy', studio_id: columbia.id)
    misery = Movie.create!(title: 'Misery', creation_year: 1990, genre: 'Horror', studio_id: columbia.id)
    smurfs = Movie.create!(title: 'Smurfs', creation_year: 2011, genre: 'Family', studio_id: columbia.id)

    hardy = Actor.create!(name: 'Tom Hardy', age: 50)
    elliott = Actor.create!(name: 'Ellen Page', age:40)
    goldblum = Actor.create!(name: 'Jeff Goldblum', age: 55)
    bates = Actor.create!(name: 'Kathy Bates', age: 60)
    reeves = Actor.create!(name: 'Keanu Reeves', age: 55)
    weaving = Actor.create!(name: 'Hugo Weaving', age: 60)
    moss = Actor.create!(name: 'Carrie-Anne Moss', age: 50)

    MovieActor.create!(actor_id: reeves.id, movie_id: matrix.id)
    MovieActor.create!(actor_id: weaving.id, movie_id: matrix.id)
    MovieActor.create!(actor_id: moss.id, movie_id: matrix.id)
    MovieActor.create!(actor_id: bates.id, movie_id: misery.id)
    MovieActor.create!(actor_id: goldblum.id, movie_id: jurassic.id)
    MovieActor.create!(actor_id: elliott.id, movie_id: inception.id)
    MovieActor.create!(actor_id: hardy.id, movie_id: inception.id)

    visit "/movies/#{matrix.id}"

    expect(page).to have_button('Search')

    fill_in('Find Actor', with: 'Kathy Bates')
    click_on('Search')

    expect(page).to have_content('Kathy Bates')
    expect(page).to have_button("Add #{bates.name}")

    click_on("Add #{bates.name}")
    
    expect(current_path).to eq("/movies/#{matrix.id}")
    expect(page).to have_content('Actor: Kathy Bates')
    expect(page).to have_content('Age: 60')
  end
end
