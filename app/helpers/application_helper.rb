module ApplicationHelper
  def active_game(game)
    'active' if params[:game_id] == game
  end

  def title(page_title)
    content_for :title, page_title.to_s
  end

  def description(page_description)
    content_for :description, page_description.to_s
  end
end
