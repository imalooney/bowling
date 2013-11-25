class BowlingGame
	attr_accessor :rolls, :total_score, :current_roll
	
	def initialize
		@rolls = []
		@total_score = 0
		@current_roll = 0
	end

	# Record a roll in the game.
	# 
	# pins - The Integer number of pins knocked down in this roll.
	# 
	# Returns nothing.
	def roll(pins)
		@rolls << pins
	end	

	# Returns the Integer score for this game.
	# Expects to be run after all rolls for the game have been recorded.
	def score
		while @current_roll < @rolls.size			
			init_roll

			if strike?
				score_strike
			# If you get a spare
			elsif spare?
				score_spare
			else 
				score_normal
			end
		end
		
		return @total_score
	end	

	private

	#Initialize values for roll and next_roll.
	# 
	# Returns nothing.
	def init_roll
		@roll 		= @rolls[current_roll]
		@next_roll	= @rolls[current_roll + 1]
	end	

	# Returns true if the current roll is a strike, false. otherwise.
	def strike?
		@roll == 10
	end

	# Scores a strike frame, and adds it to the total score for the game.
	# 
	# Returns nothing.
	def score_strike
		@total_score += 10 + @next_roll + @rolls[@current_roll + 2]
		@current_roll += 1
	end

	# Returns true if the current roll is a strike and false otherwise.
	def spare?
		@roll + @next_roll == 10
	end

	# Adds score for frame where spare is acheived to total score.
	# 
	# Returns nothing.
	def score_spare
		@total_score += 10 + @rolls[@current_roll + 2]
		@current_roll += 2
	end

	# Adds score for pins down to total score.
	# 
	# Returns nothing.
	def score_normal
		@total_score += @roll + @next_roll
		@current_roll += 2
	end

end