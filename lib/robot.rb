class Robot

	def initialize(map)
		@map = map
		@x = nil
		@y = nil
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
		if !@x || !@y
			return nil
		end

		[@x, @y]
	end

end
