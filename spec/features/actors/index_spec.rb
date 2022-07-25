require 'rails_helper'

RSpec.describe 'the actor' do
  it 'list all actors and attributes' do
    hardy = Actor.create!(name: 'Tom Hardy', age: 50)
    elliott = Actor.create!(name: 'Ellen Page', age:40)
    reeves = Actor.create!(name: 'Keanu Reeves', age: 55)
    goldblum = Actor.create!(name: 'Jeff Goldblum', age: 55)
    bates = Actor.create!(name: 'Kathy Bates', age: 60)
    weaving = Actor.create(name: 'Hugo Weaving', age: 60)
    moss = Actor.create(name: 'Carrie-Anne Moss', age: 50)

    visit '/actors'

    within '#actors-0' do

      expect(page).to have_content('Name: Tom Hardy')
      expect(page).to have_content('Age: 50')
    end

    within '#actors-1' do

      expect(page).to have_content('Name: Ellen Page')
      expect(page).to have_content('Age: 40')
    end

    within '#actors-2' do

      expect(page).to have_content('Name: Keanu Reeves')
      expect(page).to have_content('Age: 55')
    end

    within '#actors-3' do

      expect(page).to have_content('Name: Jeff Goldblum')
      expect(page).to have_content('Age: 55')
    end

    within '#actors-4' do
      expect(page).to have_content('Name: Kathy Bates')
      expect(page).to have_content('Age: 60')
    end 
  end
end
