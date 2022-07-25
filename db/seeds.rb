# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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

hardy = Actor.create(name: 'Tom Hardy', age: 50)
elliott = Actor.create(name: 'Ellen Page', age:40)
goldblum = Actor.create(name: 'Jeff Goldblum', age: 55)
bates = Actor.create(name: 'Kathy Bates', age: 60)
reeves = Actor.create(name: 'Keanu Reeves', age: 55)
weaving = Actor.create(name: 'Hugo Weaving', age: 60)
moss = Actor.create(name: 'Carrie-Anne Moss', age: 50)


MovieActor.create(actor_id: reeves.id, movie_id: matrix.id)
MovieActor.create(actor_id: weaving.id, movie_id: matrix.id)
MovieActor.create(actor_id: moss.id, movie_id: matrix.id)
MovieActor.create(actor_id: bates.id, movie_id: misery.id)
MovieActor.create(actor_id: goldblum.id, movie_id: jurassic.id)
MovieActor.create(actor_id: elliott.id, movie_id: inception.id)
MovieActor.create(actor_id: hardy.id, movie_id: inception.id)
