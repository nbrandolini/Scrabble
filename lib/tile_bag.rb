require 'pry'

module Scrabble
  class TileBag

    attr_reader :tiles, :number_of_tiles

    LETTER_QUANTITIES = {
      "A" => 9, "B" => 2, "C" => 2, "D" => 4, "E" => 12, "F" => 2, "G" => 3,
      "H" => 2, "I" => 9, "J" => 1, "K" => 1, "L" => 4, "M" => 2, "N" => 6,
      "O" => 8, "P" => 2, "Q" => 1, "R" => 6, "S" => 4, "T" => 6,
      "U" => 4, "V" => 2, "W" => 2, "X" => 1, "Y" => 2, "Z" => 1 }

    def initialize
      @tiles = []
      @number_of_tiles = LETTER_QUANTITIES.reduce(0) { |sum, letter| sum + letter[1] }
    end

    def draw_tiles(num)
      if !(Integer === num) || num < 0
        raise ArgumentError.new("Error: invalid number")
      elsif num > @number_of_tiles
        raise ArgumentError.new("Error: Not enough tiles in the bag")
      else
        @number_of_tiles -= num
        return @tiles = LETTER_QUANTITIES.keys.sample(num)
      end
    end

    def tiles_remaining
      return @number_of_tiles
    end

  end
end
