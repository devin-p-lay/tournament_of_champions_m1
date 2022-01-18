class Team < ApplicationRecord
  has_many :players
  has_many :competition_teams
  has_many :competitions, through: :competition_teams

  def average_age
    players.average("age").to_i
  end

  def self.age_ordered
    order("average_age DESC")
  end
end