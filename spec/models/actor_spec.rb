require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many :movie_actors }
    it { should have_many(:movies).through(:movie_actors) }
  end

  describe 'model methods' do
    it 'lists actors youngest to oldest' do
      reeves = Actor.create(name: 'Keanu Reeves', age: 55)
      weaving = Actor.create(name: 'Hugo Weaving', age: 60)
      moss = Actor.create(name: 'Carrie-Anne Moss', age: 50)

      expect(Actor.beauty_before_age).to eq([moss, reeves, weaving])
    end
  end
end
