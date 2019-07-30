require 'test_helper'

class TimeOfDayAttrTest < ActiveSupport::TestCase
  context '::delocalize' do
    should 'convert time of day to seconds' do
      assert_equal 36000, TimeOfDayAttr.delocalize("10:00")
    end
  end

  context '::localize' do
    should 'convert seconds to time of day' do
      assert_equal "10:00", TimeOfDayAttr.localize(36000)
      assert_equal "10:00", TimeOfDayAttr.l(36000)
    end
  end

  context '::to_decimal' do
    should 'convert seconds to decimal ' do
      assert_equal 10.0.to_d, TimeOfDayAttr.to_decimal(36000)
    end
  end

  context '::from_decimal' do
    should 'convert decimal to seconds' do
      assert_equal 36000, TimeOfDayAttr.from_decimal(10.0)
    end
  end
end
