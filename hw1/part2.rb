class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	
	ng = []
	game.each do |x|
		if x.flatten.length == 16
			x = rps_tournament_winner(x)
		elsif x.flatten.length == 8
			x = rps_result(x[0],[1])
		end
		raise NoSuchStrategyError unless x[1].match(/[RPS]/i)
		x[1] = x[1].upcase
		ng << x
	end
	game = ng

	
	result = game[1]	
	if game[0][1] == game[1][1]
		result = game[0]
	elsif game[0][1] == "R"
		result = game[0] unless game[1][1] == "P"
	elsif game[0][1] == "P"
		result = game[0] unless game[1][1] == "S"
	else
		result = game[0] unless game[1][1] == "R"
	end
	
	return result
end

def rps_result(m1, m2)
	return rps_game_winner([rps_game_winner(m1),rps_game_winner(m2)])
end

def rps_tournament_winner(tournament)
	
	rt = []
	
	tournament.each do |mg| 
		rt << rps_result(mg[0],mg[1])
	end
	
	return rps_game_winner(rt)
	
end
