class Enlist < ActiveRecord::Base
  attr_accessible :game_id, :user_id
  has_many :games
  has_many :users
end
