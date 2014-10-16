class User < ActiveRecord::Base
  attr_accessible :attend_count, :balance, :name, :note, :password, :team_id, :vip
end
