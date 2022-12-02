# frozen_string_literal: true

require 'solution/day02'

RSpec.describe Day02 do
  input = [
    %i[a y],
    %i[b x],
    %i[c z]
  ]
  describe 'part1' do
    it 'runs against example' do
      sol = described_class.new
      expect(sol.part1(input)).to eq(15)
    end
  end

  describe 'part2' do
    it 'runs against example' do
      sol = described_class.new
      expect(sol.part2(input)).to eq(12)
    end
  end
end
