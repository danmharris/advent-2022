# frozen_string_literal: true

require 'solution/day07'

RSpec.describe Day07 do
  let(:text) do
    <<~INPUT
      $ cd /
      $ ls
      dir a
      14848514 b.txt
      8504156 c.dat
      dir d
      $ cd a
      $ ls
      dir e
      29116 f
      2557 g
      62596 h.lst
      $ cd e
      $ ls
      584 i
      $ cd ..
      $ cd ..
      $ cd d
      $ ls
      4060174 j
      8033020 d.log
      5626152 d.ext
      7214296 k
    INPUT
  end

  let(:input) do
    Node.new('/', [
               Node.new('a', [
                          Node.new('e', [
                                     Node.new('i', [], 584)
                                   ]),
                          Node.new('f', [], 29116),
                          Node.new('g', [], 2557),
                          Node.new('h.lst', [], 62596)
                        ]),
               Node.new('b.txt', [], 14848514),
               Node.new('c.dat', [], 8504156),
               Node.new('d', [
                          Node.new('j', [], 4060174),
                          Node.new('d.log', [], 8033020),
                          Node.new('d.ext', [], 5626152),
                          Node.new('k', [], 7214296)
                        ])
             ])
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
      expect(sol.part1(input)).to eq(95437)
    end
  end

  describe 'part2' do
    it 'runs against example' do
      sol = described_class.new
      expect(sol.part2(input)).to eq(24933642)
    end
  end
end
