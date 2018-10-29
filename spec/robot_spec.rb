require 'spec_helper'

RSpec.describe "Robot" do

  describe Robot do
    subject(:robot) do
		robot = Robot.new(Map.new(5,5))
    end

	it 'nil if not placed' do
		expect(robot.get_position).to eq nil
	end

	it 'has_xy?' do
		expect(robot.has_xy?).to eq false
		robot.place([5,5])
		expect(robot.has_xy?).to eq false
		robot.place([0,0])
		expect(robot.has_xy?).to eq true
	end

	it 'been_placed?' do
		expect(robot.been_placed?).to eq false
		robot.place([0,0])
		expect(robot.been_placed?).to eq false
		robot.set_direction(Map::LEFT)
		expect(robot.been_placed?).to eq true
	end

	it 'nil if placed outside of map' do
		expect(robot.place([5,5])).to eq false
		expect(robot.get_position).to eq nil
	end

	it 'set_direction' do
		robot.set_direction(Map::LEFT)
		expect(robot.get_direction).to eq Map::LEFT

		robot.set_direction(Map::UP)
		expect(robot.get_direction).to eq Map::UP
	end

	it 'can not turn if not placed' do
		expect(robot.turn(Map::LEFT)).to eq false
	end

	it 'can not move if not placed' do
		expect(robot.move).to eq false
	end

	it 'can not move if no direction' do
		robot.place([0,0])
		expect(robot.get_position).to eq [0, 0]
		expect(robot.move).to eq false
	end

	it 'can move up' do
		robot.place([0,0])
		robot.set_direction(Map::UP)
		robot.move
		expect(robot.get_position).to eq [0, 1]
	end

	it 'can move right' do
		robot.place([1,1])
		robot.set_direction(Map::RIGHT)
		robot.move
		expect(robot.get_position).to eq [2, 1]
	end

	it 'can move left' do
		robot.place([1,1])
		robot.set_direction(Map::LEFT)
		robot.move
		expect(robot.get_position).to eq [0, 1]
	end

	it 'can move down' do
		robot.place([1,1])
		robot.set_direction(Map::DOWN)
		robot.move
		expect(robot.get_position).to eq [1, 0]
	end

	it 'can echo' do
		expect { robot.echo }.to output("\n").to_stdout
		expect(robot.report).to eq nil
		robot.place([0, 0])
		expect(robot.report).to eq nil
		expect { robot.echo }.to output("\n").to_stdout
		robot.set_direction(Map::LEFT)
		
		expect { robot.echo }.to output((robot.report + "\n")).to_stdout
	end

	it 'can report' do
		expect(robot.report).to eq nil
		robot.place([0, 0])
		expect(robot.report).to eq nil
		robot.set_direction(Map::LEFT)
		expect(robot.report).to eq "0, 0, #{Map::LEFT}"
	end

	it 'can turn' do
		robot.place([0, 0])
		robot.set_direction(Map::LEFT)

		robot.turn(Map::LEFT)
		expect(robot.get_direction).to eq Map::DOWN

		robot.turn(Map::LEFT)
		expect(robot.get_direction).to eq Map::RIGHT

		robot.turn(Map::LEFT)
		expect(robot.get_direction).to eq Map::UP

		robot.turn(Map::LEFT)
		expect(robot.get_direction).to eq Map::LEFT

		robot.turn(Map::RIGHT)
		expect(robot.get_direction).to eq Map::UP
		robot.turn(Map::RIGHT)
		expect(robot.get_direction).to eq Map::RIGHT
		robot.turn(Map::RIGHT)
		expect(robot.get_direction).to eq Map::DOWN
	end

	it 'can be place' do
		expect(robot.place([0,0])).to eq true
		expect(robot.get_position).to eq [0,0]

		expect(robot.place([4,4])).to eq true
		expect(robot.get_position).to eq [4,4]

		expect(robot.place([2,2])).to eq true
		expect(robot.get_position).to eq [2,2]
	end


  end

end
