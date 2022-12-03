# frozen_string_literal: true

require 'solution/day03'

RSpec.describe Day03 do
  input = %w[
    vJrwpWtwJgWrhcsFMMfFFhFp
    jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
    PmmdzqPrVvPwwTWBwg
    wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
    ttgJtRGJQctTZtZT
    CrZsJsPPZsGzwwsLwLmpwMDw
  ]

  describe 'part1' do
    it 'runs against example' do
      sol = described_class.new
      expect(sol.part1(input)).to eq(157)
    end
  end

  describe 'part2' do
    it 'runs against example' do
      sol = described_class.new
      expect(sol.part2(input)).to eq(70)
    end
  end
end
