module ApplicationHelper
  def active_game(game)
    'active' if params[:game_id] == game
  end
end
