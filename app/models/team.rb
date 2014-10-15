class Team < ActiveRecord::Base
  attr_accessible :name, :note
  has_many :users
end
