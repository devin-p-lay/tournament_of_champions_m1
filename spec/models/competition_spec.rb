require 'rails_helper'

describe Competition do
  describe 'relationships' do
    it { should have_many :competition_teams }
    it { should have_many(:teams).through(:competition_teams) }
  end

  describe 'class methods' do
    describe '.average_age' do
      it 'returns the average age of all player in the competition' do
        @comp1 = Competition.create!(name: 'Regional Baseball', location: 'Denver', sport: 'Baseball')

        @team1 = Team.create!(hometown: "Atown", nickname: "Astros")
        @player1 = @team1.players.create!(name: "Aaron Allball", age: 11)
        @player2 = @team1.players.create!(name: "Billy Bigshoes", age: 12)
        @player3 = @team1.players.create!(name: "Caleb Can-do", age: 13)

        @team2 = Team.create!(hometown: "Btown", nickname: "Bombers")
        @player4 = @team2.players.create!(name: "Donnny Downtown", age: 11)
        @player5 = @team2.players.create!(name: "Erik Easy", age: 13)
        @player6 = @team2.players.create!(name: "Freddy Foulout", age: 12)

        @competition_team1 = CompetitionTeam.create!(competition_id: @comp1.id, team_id: @team1.id)
        @competition_team2 = CompetitionTeam.create!(competition_id: @comp1.id, team_id: @team2.id)

        expect(@comp1.average_age).to eq(12)
      end
    end
  end
end