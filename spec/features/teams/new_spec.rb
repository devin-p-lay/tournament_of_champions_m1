require 'rails_helper'

describe 'new competition team' do
  before do
    @comp1 = Competition.create!(name: 'Regional Baseball', location: 'Denver', sport: 'Baseball')
    @team3 = Team.create!(hometown: "Ctown", nickname: "Cyclones")
    visit new_competition_team_path(@comp1)
  end

  describe 'form to register team' do
    it 'it creates a new competition team' do
      fill_in 'Team Name', with: 'Cyclones'
      click_on 'Register Team'
      expect(current_path).to eq(competition_path(@comp1))
      expect(page).to have_content(@team3.hometown)
      expect(page).to have_content(@team3.nickname)
    end
  end
end 