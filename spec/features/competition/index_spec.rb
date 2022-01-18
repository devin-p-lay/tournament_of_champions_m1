require 'rails_helper'

describe 'competitions index' do
  before do
    @comp1 = Competition.create!(name: 'Regional Boys Baseball', location: 'Denver', sport: 'Baseball')
    @comp2 = Competition.create!(name: 'Regional Girls Basketball', location: 'Boulder', sport: 'Basketball')
    visit competitions_path
  end

  describe 'display' do
    it 'names of all competitions' do
      expect(page).to have_content(@comp1.name)
      expect(page).to have_content(@comp2.name)
    end
  end
end
