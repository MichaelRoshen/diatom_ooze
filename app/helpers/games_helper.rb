#encoding: utf-8
module GamesHelper
	def game_date(game)
		return Time.now.strftime("%m月%d日") if game.nil?
		game.game_date.strftime("%m月%d日") + game.start_time.to_s + "~" + game.end_time.to_s + "点"
	end
end
