require 'test_helper'

module TimeOfDayAttr
  class DecimalTimeTest < ActiveSupport::TestCase
    context '::decimal_to_seconds' do
      should 'convert decimal to seconds' do
        assert_equal 360,   DecimalTime.decimal_to_seconds(0.1)   # 6 mins
        assert_equal 900,   DecimalTime.decimal_to_seconds(0.25)  # 15 min
        assert_equal 1198,  DecimalTime.decimal_to_seconds(0.333) # about 20 mins
        assert_equal 1800,  DecimalTime.decimal_to_seconds(0.5)   # 30 mins
        assert_equal 2700,  DecimalTime.decimal_to_seconds(0.75)  # 45 mins
        assert_equal 3600,  DecimalTime.decimal_to_seconds(1.0)   # 1 hour
        assert_equal 5400,  DecimalTime.decimal_to_seconds(1.5)   # 1:30
      end

      should 'covert from decimal string' do
        assert_equal 1800, DecimalTime.decimal_to_seconds('0.5')
        assert_equal 5400, DecimalTime.decimal_to_seconds('1.5')
      end

      should 'return nil if not a valid decimal' do
        assert_nil DecimalTime.decimal_to_seconds('invalid')
        assert_nil DecimalTime.decimal_to_seconds(nil)
      end
    end

    context '::seconds_to_decimal' do
      should 'convert seconds to decimal' do
        assert_equal BigDecimal('0.1'), DecimalTime.seconds_to_decimal(360)
        assert_equal BigDecimal('0.333333333333333333e0'), DecimalTime.seconds_to_decimal(1200)
        assert_equal BigDecimal('1.0'), DecimalTime.seconds_to_decimal(3600)
      end

      should 'return rounded value' do
        assert_equal BigDecimal('0.33e0'), DecimalTime.seconds_to_decimal(1200, round: 2)
      end

      should 'return nil' do
        assert_nil DecimalTime.seconds_to_decimal(nil)
      end
    end
  end
end
