module TimeOfDayAttr
  module ActiveRecordExtension
    extend ActiveSupport::Concern

    module ClassMethods
      def time_of_day_attr(*attrs)
        attrs.each do |attr|
          define_method("localized_#{attr}=") do |value|
            seconds = TimeOfDay.convert_to_seconds(value)
            public_send("#{attr}=", seconds)
          end

          define_method("localized_#{attr}") do |opts = {}|
            Seconds.convert_to_time_of_day(public_send(attr), opts)
          end

          define_method("decimal_#{attr}=") do |value|
            seconds = TimeOfDayAttr::DecimalTime.decimal_to_seconds(value)
            public_send("#{attr}=", seconds)
          end

          define_method("decimal_#{attr}") do |opts = {}|
            DecimalTime.seconds_to_decimal(public_send(attr), opts)
          end
        end
      end
    end
  end
end
