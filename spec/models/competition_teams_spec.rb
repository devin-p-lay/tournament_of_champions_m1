require 'rails_helper'

describe CompetitionTeam do
  it { should belong_to :competition }
  it { should belong_to :team }
end 