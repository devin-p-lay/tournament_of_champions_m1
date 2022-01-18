class TeamsController < ApplicationController
  def new
    @competition = Competition.find(params[:competition_id])
    @team = Team.new
  end

  def create
    @competition = Competition.find(params[:competition_id])
    @team = Team.create(team_params)
    CompetitionTeam.create!(competition_id: params[:competition_id], team_id: @team.id)
    redirect_to competition_path(@competition)
  end

    private
      def team_params
        params.permit(:hometown, :nickname)
      end
end