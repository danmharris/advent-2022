# frozen_string_literal: true

require 'solution/day08'

RSpec.describe Day08 do
  let(:text) do
    <<~TEXT.split(/\n/)
      30373
      25512
      65332
      33549
      35390
    TEXT
  end

  let(:input) do
    [
      3, 0, 3, 7, 3,
      2, 5, 5, 1, 2,
      6, 5, 3, 3, 2,
      3, 3, 5, 4, 9,
      3, 5, 3, 9, 0
    ]
  end

  describe 'parse' do
    it 'parses correctly' do
      sol = described_class.new
      expect(sol.parse(text)).to eq(input)
    end
  end

  describe 'part1' do
    it 'runs against example' do
      sol = described_class.new
      expect(sol.part1(input)).to eq(21)
    end
  end

  describe 'part2' do
    it 'runs against example' do
      sol = described_class.new
      expect(sol.score(input, 3, 2)).to eq(8)
    end
  end
end
