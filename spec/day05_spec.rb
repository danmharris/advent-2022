# frozen_string_literal: true

require 'solution/day05'

RSpec.describe Day05 do
  let(:input) do
    {
      initial: [
        nil,
        %w[Z N],
        %w[M C D],
        %w[P]
      ],
      moves: [
        [1, 2, 1],
        [3, 1, 3],
        [2, 2, 1],
        [1, 1, 2]
      ]
    }
  end

  describe 'part1' do
    it 'runs against example' do
      sol = described_class.new
      expect(sol.part1(input)).to eq('CMZ')
    end
  end

  describe 'part2' do
    it 'runs against example' do
      sol = described_class.new
      expect(sol.part2(input)).to eq('MCD')
    end
  end
end
