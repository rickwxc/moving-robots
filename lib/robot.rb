class Robot

	def initialize(map)
		@map = map
		@x = nil
		@y = nil
		@direction = nil
	end

	def set_direction(direction)
		@direction = direction
	end

	def get_direction
		@direction
	end

	def move
		if !@direction or !self.been_placed?
			return false
		end

		x = @x
		y = @y

		if @direction  == Map::LEFT
			x = x - 1
		elsif @direction  == Map::RIGHT
			x = x + 1
		elsif @direction  == Map::UP
			y = y + 1
		elsif @direction  == Map::DOWN
			y = y - 1
		else
			return false
		end
		
		if !@map.is_valid([x,y])
			return false
		end

		@x = x
		@y = y

		return true
	end

	def been_placed?
		if !@x || !@y
			return false
		end

		return true
	end

	def place(point)
		if !@map.is_valid(point)
			return false
		end
		@x = point[0]
		@y = point[1]

		return true
	end

	def get_position
		if !self.been_placed?
			return nil
		end

		[@x, @y]
	end

	def turn(left_or_right)
		if !self.been_placed?
			return false
		end

		@direction = Map.GET_DIRECTION_BY_TURN(@direction, left_or_right)
		true
	end

end
