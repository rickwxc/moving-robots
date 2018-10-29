class Map

	LEFT = 1
	RIGHT = 2
	UP = 3
	DOWN = 4

	def initialize(x, y)
		@x = 0
		@y = 0
		@top = x - 1
		@right = y - 1
	end

	def is_valid(point)
		if point[0] < @x or point[0] > @right
			return false
		end

		if point[1] < @y or point[1] > @top
			return false
		end

		return true
	end

	def get_next(point, direction)
		x = point[0]
		y = point[1]

		if direction  == Map::LEFT
			x = x - 1
		elsif direction  == Map::RIGHT
			x = x + 1
		elsif direction  == Map::UP
			y = y + 1
		elsif direction  == Map::DOWN
			y = y - 1
		end
		
		if self.is_valid([x,y])
			return [x,y]
		end

		return point
	end

	def origin
		[@x, @y]
	end

	def top_corner
		[@top, @right]
	end

	def self.GET_DIRECTION_BY_TURN(cur_dir, right_or_left)
		r = {
			RIGHT => DOWN,
			DOWN => LEFT,
			LEFT => UP,
			UP => RIGHT,
		}

		if right_or_left == RIGHT
			return r[cur_dir]
		end

		return r.invert[cur_dir]
	end

end
