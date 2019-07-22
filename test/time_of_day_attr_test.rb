require 'test_helper'

class TimeOfDayAttrTest < ActiveSupport::TestCase
  context '::delocalize' do
    should 'return seconds' do
      assert_equal 4500, TimeOfDayAttr.delocalize('1:15')
    end
  end

  context '::localize' do
    should 'return string representation' do
      assert_equal ' 1:15', TimeOfDayAttr.localize(4500)
    end
  end

  context '::decimal' do
    should 'return decimal representation' do
      assert_equal '1.25', TimeOfDayAttr.decimal(4500)
    end

    should 'return decimal representation with rounding' do
      assert_equal '0.33', TimeOfDayAttr.decimal(1200, round: 2)
    end
  end
end
