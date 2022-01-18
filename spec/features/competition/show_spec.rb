require 'rails_helper'

describe 'competition show' do
  before do
    @comp1 = Competition.create!(name: 'Regional Baseball', location: 'Denver', sport: 'Baseball')
    @comp2 = Competition.create!(name: 'Regional Basketball', location: 'Boulder', sport: 'Basketball')

    @team1 = Team.create!(hometown: "Atown", nickname: "Astros")
    @player1 = @team1.players.create!(name: "Aaron Allball", age: 11)
    @player2 = @team1.players.create!(name: "Billy Bigshoes", age: 12)
    @player3 = @team1.players.create!(name: "Caleb Can-do", age: 13)

    @team2 = Team.create!(hometown: "Btown", nickname: "Bombers")
    @player4 = @team2.players.create!(name: "Donnny Downtown", age: 11)
    @player5 = @team2.players.create!(name: "Erik Easy", age: 13)
    @player6 = @team2.players.create!(name: "Freddy Foulout", age: 12)

    @team3 = Team.create!(hometown: "Ctown", nickname: "Cyclones")
    @player7 = @team3.players.create!(name: "Gabby Goodplay", age: 14)
    @player8 = @team3.players.create!(name: "Hank Hardball", age: 13)
    @player9 = @team3.players.create!(name: "Ida Idol", age: 12)

    @competition_team1 = CompetitionTeam.create!(competition_id: @comp1.id, team_id: @team1.id)
    @competition_team2 = CompetitionTeam.create!(competition_id: @comp1.id, team_id: @team2.id)
    @competition_team3 = CompetitionTeam.create!(competition_id: @comp2.id, team_id: @team3.id)
    visit competition_path(@comp1)
  end

  describe 'display' do
    it 'competition name, location, and sport' do
      expect(page).to have_content(@comp1.name)
      expect(page).to have_content(@comp1.location)
      expect(page).to have_content(@comp1.sport)
      expect(page).to_not have_content(@comp2.name)
    end

    it 'competition team names and hometown' do
      expect(page).to have_content(@team1.nickname)
      expect(page).to have_content(@team1.hometown)
      expect(page).to have_content(@team2.nickname)
      expect(page).to have_content(@team2.hometown)
      expect(page).to_not have_content(@team3)
    end

    it 'average age of all players in the competition' do
      expect(page).to have_content("Average age of all players: #{@comp1.average_age}")
    end

    it 'link to register a new team' do
      click_link 'Register New Team'
      expect(current_path).to eq(new_competition_team_path(@comp1))
    end
  end
end