class RacesController < ApplicationController
  def show
    @race = Race.friendly.find(params[:id])
    @game = @race.game
    beginnings = Syllable.where(game_id: @race.game.id, race_id: @race.id, part: 'beginning').count
    middles = Syllable.where(game_id: @race.game.id, race_id: @race.id, part: 'middle').count
    ends = Syllable.where(game_id: @race.game.id, race_id: @race.id, part: 'end').count
    @total_combinations = beginnings * middles * ends
  end
end
