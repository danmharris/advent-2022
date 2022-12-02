# frozen_string_literal: true

require 'solution'

class Day02 < Solution
  def parse
    data.map do |line|
      line.split.map(&:downcase).map(&:to_sym)
    end
  end

  def part1(input)
    input.map do |round|
      theirs = normalise(round[0])
      ours = normalise(round[1])

      outcome_score(outcome(theirs, ours)) + piece_score(ours)
    end.sum
  end

  def part2(input)
    input.map do |round|
      theirs = normalise(round[0])

      ours = case round[1]
             when :x
               losing_move(theirs)
             when :y
               theirs
             when :z
               winning_move(theirs)
             end

      outcome_score(outcome(theirs, ours)) + piece_score(ours)
    end.sum
  end

  private

  def normalise(val)
    case val
    when :a, :x
      :rock
    when :b, :y
      :paper
    when :c, :z
      :scissors
    end
  end

  def winning_move(theirs)
    moves = {
      rock: :paper,
      paper: :scissors,
      scissors: :rock
    }
    moves[theirs]
  end

  def losing_move(theirs)
    moves = {
      rock: :scissors,
      paper: :rock,
      scissors: :paper
    }
    moves[theirs]
  end

  def outcome(theirs, ours)
    return :draw if theirs == ours
    return :win if ours == winning_move(theirs)

    :lose
  end

  def outcome_score(outcome)
    scores = {
      win: 6,
      draw: 3,
      lose: 0
    }
    scores[outcome]
  end

  def piece_score(piece)
    scores = {
      rock: 1,
      paper: 2,
      scissors: 3
    }
    scores[piece]
  end
end
