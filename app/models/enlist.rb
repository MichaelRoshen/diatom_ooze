class Enlist < ActiveRecord::Base
  attr_accessible :game_id, :user_id
  belongs_to :game
  belongs_to :user

  after_save :cal_balance

  def cal_balance
  	return if user.nil?
  	balance = user.balance
  	cost =  user.vip? ? 25 : 30
  	user.balance = balance - cost
  	user.save()
  end
end
