class HomeController < ApplicationController
  def index
  	@team = Team.first
  	@game = Game.all_games.first
  end

  def login
  end

  def admin
  end
end
