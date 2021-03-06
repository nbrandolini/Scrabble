require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/tile_bag'
require 'pry'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'TileBag' do
  before do
    @tile_bag = Scrabble::TileBag.new
  end

  describe 'initialize' do
    it "Set-up the instance with a collection of all default tiles" do
      @tile_bag.must_respond_to :tiles
      @tile_bag.tiles.must_be_instance_of Array
    end
  end

  describe 'draw_tiles' do
    it "Returns a collection of random tiles" do
      @tile_bag.draw_tiles(7).length.must_equal 7
      @tile_bag.draw_tiles(7).must_be_instance_of Array
      @tile_bag.draw_tiles(7).all?{String}.must_equal true
      @tile_bag.draw_tiles(7).all?{ |l| l.length == 1 }.must_equal true
    end

    it "Removes the tiles from the default set" do
      original_tiles = @tile_bag.tiles

      (@tile_bag.draw_tiles(7) != original_tiles).must_equal true
    end

    it "Raise an ArgumentError if user input invalid number" do
      proc { @tile_bag.draw_tiles("1") }.must_raise ArgumentError
      proc { @tile_bag.draw_tiles( -2 ) }.must_raise ArgumentError
      proc { @tile_bag.draw_tiles( 100 ) }.must_raise ArgumentError
    end
  end

  describe 'tiles_remaining' do
    it "Returns the number of tiles remaining in the bag" do
      @tile_bag.draw_tiles(7)

      @tile_bag.number_of_tiles.must_equal 91
    end
  end

end
