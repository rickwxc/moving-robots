require 'spec_helper'

RSpec.describe "Map" do

  describe Map do
    subject(:map) do
		map = Map.new(5, 5)
    end

	it 'origin at 0,0' do
		expect(map.origin).to eq [0,0]
	end

	it 'end at 4,4' do
		expect(map.top_corner).to eq [4,4]
	end


	it 'is_valid point' do
		expect(map.is_valid([0, 0])).to eq true
		expect(map.is_valid([4, 4])).to eq true
	end

	it 'not valid point' do
		expect(map.is_valid([5, 5])).to eq false
		expect(map.is_valid([-1, 0])).to eq false
		expect(map.is_valid([0, -1])).to eq false
	end

	it 'get next point' do
		expect(map.get_next([0,0], Map::LEFT)).to eq [0,0]
		expect(map.get_next([0,0], Map::RIGHT)).to eq [1,0]
		expect(map.get_next([0,0], Map::UP)).to eq [0,1]
		expect(map.get_next([0,0], Map::DOWN)).to eq [0,0]

		expect(map.get_next([4,4], Map::LEFT)).to eq [3,4]
		expect(map.get_next([4,4], Map::RIGHT)).to eq [4,4]
		expect(map.get_next([4,4], Map::UP)).to eq [4,4]
		expect(map.get_next([4,4], Map::DOWN)).to eq [4,3]

		expect(map.get_next([1,1], Map::LEFT)).to eq [0,1]
		expect(map.get_next([1,1], Map::RIGHT)).to eq [2,1]
		expect(map.get_next([1,1], Map::UP)).to eq [1,2]
		expect(map.get_next([1,1], Map::DOWN)).to eq [1,0]

	end



  end

end
