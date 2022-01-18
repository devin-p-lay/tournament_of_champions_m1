require 'rails_helper'

describe 'teams index' do
  before do
    @team1 = Team.create!(hometown: "Atown", nickname: "Astros")
    @player1 = @team1.players.create!(name: "Aaron Allball", age: 13)
    @player2 = @team1.players.create!(name: "Billy Bigshoes", age: 12)
    @player3 = @team1.players.create!(name: "Caleb Can-do", age: 14)
    #average age: 13

    @team2 = Team.create!(hometown: "Btown", nickname: "Bombers")
    @player4 = @team2.players.create!(name: "Donnny Downtown", age: 11)
    @player5 = @team2.players.create!(name: "Erik Easy", age: 13)
    @player6 = @team2.players.create!(name: "Freddy Foulout", age: 12)
    #average age: 12

    @team3 = Team.create!(hometown: "Ctown", nickname: "Cyclones")
    @player7 = @team3.players.create!(name: "Gabby Goodplay", age: 14)
    @player8 = @team3.players.create!(name: "Hank Hardball", age: 13)
    @player9 = @team3.players.create!(name: "Ida Idol", age: 15)
    #average age: 14

    visit teams_path
  end

  describe 'display' do
    it 'names of all teams ordered by average age desc' do
      expect(@team3.name).to appear_before(@team1.name)
      expect(@team1.name).to appear_before(@team2.name)
    end

    it 'next to each team, average age of players' do
      within "#team-#{@team1.id}"
        expect(page).to have_content('Players average age: 13')
      end 
    end
  end