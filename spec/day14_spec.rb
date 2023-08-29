# frozen_string_literal: true

require 'solution/day14'

RSpec.describe Day14 do
  let(:input) do
    <<~TEXT
      498,4 -> 498,6 -> 496,6
      503,4 -> 502,4 -> 502,9 -> 494,9
    TEXT
  end

  describe 'part1' do
    it 'runs against example' do
      sol = described_class.new
      expect(sol.part1(sol.parse(input))).to eq(24)
    end
  end

  describe 'part2' do
    it 'runs against example' do
      sol = described_class.new
      expect(sol.part2(sol.parse(input))).to eq(93)
    end
  end
end
