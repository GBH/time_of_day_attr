require 'bigdecimal'

module TimeOfDayAttr
  module DecimalTime
    def self.decimal_to_seconds(decimal)
      number = BigDecimal(decimal.to_s)
      hours = number.to_i
      minutes = number.modulo(1) * 60
      ((hours * 3600) + (minutes * 60)).to_i
    rescue ArgumentError
      nil
    end

    def self.seconds_to_decimal(seconds, options = {})
      return nil if seconds.nil?

      number = BigDecimal(seconds) / 3600
      options[:round].present? ? number.round(options[:round]) : number
    end
  end
end
