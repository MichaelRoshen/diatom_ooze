class Site < ActiveRecord::Base
  attr_accessible :address, :note, :price
  belongs_to :game
end
