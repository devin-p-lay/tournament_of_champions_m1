class Competition < ApplicationRecord
  has_many :competition_teams
  has_many :teams, through: :competition_teams
  has_many :players, through: :teams

  def average_age
    players.average("age").to_i
  end
end