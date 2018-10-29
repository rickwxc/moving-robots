require 'spec_helper'

RSpec.describe "Robot" do

  describe Robot do
    subject(:robot) do
		robot = Robot.new(Map.new(5,5))
    end

	it 'nil if not placed' do
		expect(robot.get_position).to eq nil
	end

	it 'nil if placed outside of map' do
		expect(robot.place([5,5])).to eq false
		expect(robot.get_position).to eq nil
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
