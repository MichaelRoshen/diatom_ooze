class HomeController < ApplicationController
  def index
  	@team = Team.first
  end

  def login
  end
end
