class Game < ActiveRecord::Base
  attr_accessible :attend_count, :end_time, :game_date, :site_id, :start_time, :status
  belongs_to :site
  has_many :enlists
  has_many :users, through: :enlists
  scope :all_games, order: "updated_at desc"
end
