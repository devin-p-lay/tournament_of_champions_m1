class CreateCompetitionTeam < ActiveRecord::Migration[5.2]
  def change
    create_table :competition_teams do |t|
      t.references :competition
      t.references :team

      t.timestamps
    end
  end
end
