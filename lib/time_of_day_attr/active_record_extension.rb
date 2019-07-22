module TimeOfDayAttr
  module ActiveRecordExtension
    extend ActiveSupport::Concern

    module ClassMethods
      def time_of_day_attr(*attrs)
        options = attrs.extract_options!

        include AttrWriterModule.new(attrs, options)
      end
    end
  end

  module AttrWriterModule
    # rubocop:disable Metrics/MethodLength
    def self.new(attrs, options)
      Module.new do
        attrs.each do |attr|
          define_method("localized_#{attr}=") do |value|
            seconds = TimeOfDayAttr.delocalize(value, options)
            public_send("#{attr}=", seconds)
          end

          define_method("decimal_#{attr}=") do |value|
            seconds = TimeofDayAttr.decimal_to_seconds(value)
            public_send("#{attr}=", seconds)
          end
        end
      end
    end
    # rubocop:enable Metrics/MethodLength
  end
end
