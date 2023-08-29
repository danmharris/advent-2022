# frozen_string_literal: true

require 'solution/day13'

RSpec.describe Day13 do
  let(:text) do
    <<~TEXT
      [1,1,3,1,1]
      [1,1,5,1,1]

      [[1],[2,3,4]]
      [[1],4]

      [9]
      [[8,7,6]]

      [[4,4],4,4]
      [[4,4],4,4,4]

      [7,7,7,7]
      [7,7,7]

      []
      [3]

      [[[]]]
      [[]]

      [1,[2,[3,[4,[5,6,7]]]],8,9]
      [1,[2,[3,[4,[5,6,0]]]],8,9]
    TEXT
  end

  let(:input) do
    [
      [
        [1, 1, 3, 1, 1],
        [1, 1, 5, 1, 1]
      ],
      [
        [[1], [2, 3, 4]],
        [[1], 4]
      ],
      [
        [9],
        [[8, 7, 6]]
      ],
      [
        [[4, 4], 4, 4],
        [[4, 4], 4, 4, 4]
      ],
      [
        [7, 7, 7, 7],
        [7, 7, 7]
      ],
      [
        [],
        [3]
      ],
      [
        [[[]]],
        [[]]
      ],
      [
        [1, [2, [3, [4, [5, 6, 7]]]], 8, 9],
        [1, [2, [3, [4, [5, 6, 0]]]], 8, 9]
      ]
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
      expect(sol.part1(input)).to eq(13)
    end
  end

  describe 'part2' do
    it 'runs against example' do
      sol = described_class.new
      expect(sol.part2(input)).to eq(140)
    end
  end
end
