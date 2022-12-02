# frozen_string_literal: true

require 'erb'

day = ARGV.shift

lib_template = <<~LIB
  # frozen_string_literal: true

  require 'solution'

  class Day<%= day %> < Solution
    def parse

    end

    def part1(input)

    end

    def part2(input)

    end
  end
LIB
lib_content = ERB.new(lib_template)

lib_file = File.join(Dir.pwd, 'lib', 'solution', "day#{day}.rb")
File.write(lib_file, lib_content.result)

spec_template = <<~SPEC
  # frozen_string_literal: true

  require 'solution/day<%= day %>'

  RSpec.describe Day<%= day %> do
    describe 'part1' do
      it 'runs against example' do
        sol = described_class.new
        input = []
        expect(sol.part1(input)).to be_nil
      end
    end

    describe 'part2' do
      it 'runs against example' do
        sol = described_class.new
        input = []
        expect(sol.part2(input)).to be_nil
      end
    end
  end
SPEC
spec_content = ERB.new(spec_template)

spec_file = File.join(Dir.pwd, 'spec', "day#{day}_spec.rb")
File.write(spec_file, spec_content.result)
