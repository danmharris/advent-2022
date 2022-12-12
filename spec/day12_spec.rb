# frozen_string_literal: true

require 'solution/day12'

RSpec.describe Day12 do
  let(:input) do
    Grid.new(
      %w[
        S a b q p o n m
        a b c r y x x l
        a c c s z E x k
        a c c t u v w j
        a b d e f g h i
      ],
      8,
      5
    )
  end

  describe 'part1' do
    it 'runs against example' do
      sol = described_class.new
      expect(sol.part1(input)).to eq(31)
    end
  end

  describe 'part2' do
    it 'runs against example' do
      sol = described_class.new
      expect(sol.part2(input)).to eq(29)
    end
  end
end
