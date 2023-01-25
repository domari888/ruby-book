require 'minitest/autorun'
require_relative '../lib/convert_length'

 class ConvertLengthTest < Minitest::Test
  def test_convert_length
    assert_equal 39.37, convert_length(1, from: :m, to: :in)
    assert_equal 0.38, convert_length(15, from: :in, to: :m)
    assert_equal 10670.73, convert_length(35000, from: :ft, to: :m)
  end
 end


# assert_equal 39.37, convert_length(1, from: :m, to: :in) の場合
#   def convert_length(length, from: :unit_from, to: :unit_to) ~ end の
#   :unit_from に :m
#   :unit_to に :in
#   が渡される