class User < ActiveRecord::Base
  attr_accessible :attend_count, :balance, :name, :note, :team_id, :vip
  belongs_to :team
  belongs_to :enlist
end
