class Site < ActiveRecord::Base
  attr_accessible :address, :note, :price
  has_one :game
end
