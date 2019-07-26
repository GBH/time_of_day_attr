require 'test_helper'
require 'active_record'
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
require_relative 'schema'
require_relative 'models/business_hour'

class ActiveRecordExtensionTest < ActiveSupport::TestCase
  context 'default writers' do
    should 'assign values' do
      @business_hour = BusinessHour.new(
        opening: 34_200,
        closing: 63_000
      )
      assert_equal 34_200, @business_hour.opening
      assert_equal 63_000, @business_hour.closing
    end
  end

  context 'localized writers' do
    should 'assign localized values' do
      @business_hour = BusinessHour.new(
        localized_opening: '9:30',
        localized_closing: '17:30'
      )
      assert_equal 34_200,  @business_hour.opening
      assert_equal 63_000,  @business_hour.closing
      assert_equal ' 9:30', @business_hour.localized_opening
      assert_equal '17:30', @business_hour.localized_closing
    end
  end

  context 'decimal writers' do
    should 'assign decimal values' do
      @business_hour = BusinessHour.new(
        decimal_opening: '9.5',
        decimal_closing: '17.5'
      )
      assert_equal 34_200,  @business_hour.opening
      assert_equal 63_000,  @business_hour.closing
      assert_equal 9.5,     @business_hour.decimal_opening
      assert_equal 17.5,    @business_hour.decimal_closing
    end
  end
end
