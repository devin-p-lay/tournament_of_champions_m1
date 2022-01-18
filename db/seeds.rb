# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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