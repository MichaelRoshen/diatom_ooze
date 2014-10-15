class Game < ActiveRecord::Base
  attr_accessible :attend_count, :end_time, :site_id, :start_time, :status
  has_one :site
end
