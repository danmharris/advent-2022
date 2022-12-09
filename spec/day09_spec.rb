# frozen_string_literal: true

require 'solution/day09'

RSpec.describe Day09 do
  describe 'part1' do
    let(:input) do
      [
        ['R', 4],
        ['U', 4],
        ['L', 3],
        ['D', 1],
        ['R', 4],
        ['D', 1],
        ['L', 5],
        ['R', 2]
      ]
    end

    it 'runs against example' do
      sol = described_class.new
      expect(sol.part1(input)).to eq(13)
    end
  end

  describe 'part2' do
    let(:input) do
      [
        ['R', 5],
        ['U', 8],
        ['L', 8],
        ['D', 3],
        ['R', 17],
        ['D', 10],
        ['L', 25],
        ['U', 20]
      ]
    end

    it 'runs against example' do
      sol = described_class.new
      expect(sol.part2(input)).to eq(36)
    end
  end
end
