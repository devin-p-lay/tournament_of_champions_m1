require 'rails_helper'

describe 'competitions index' do
  before do
    @comp1 = Competition.create!(name: 'Regional Boys Baseball', location: 'Denver', sport: 'Baseball')
    @comp2 = Competition.create!(name: 'Regional Girls Basketball', location: 'Boulder', sport: 'Basketball')
    visit competitions_path
  end

  describe 'display' do
    describe 'names of all competitions' do
      it 'each name links to its show page' do
        within("#competition-#{@comp1.id}") do
          click_link @comp1.name
          expect(current_path).to eq(competition_path(@comp1))
        end

        visit competitions_path
        within("#competition-#{@comp2.id}") do
          click_link @comp2.name
          expect(current_path).to eq(competition_path(@comp2))
        end
      end
    end
  end
end
