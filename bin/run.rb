# frozen_string_literal: true

day = ARGV.shift

require "solution/day#{day}"

klass = Object.const_get "Day#{day}"
klass.run
