class User < ActiveRecord::Base
  attr_accessible :attend_count, :balance, :name, :note, :password, :team_id, :vip
  has_many :enlists
  has_many :games, through: :enlists
end
