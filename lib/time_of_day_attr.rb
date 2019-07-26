module TimeOfDayAttr
  DEFAULT_FORMATS = %i[default hour].freeze

  autoload :ActiveRecordExtension, 'time_of_day_attr/active_record_extension'
  autoload :FormBuilderExtension, 'time_of_day_attr/form_builder_extension'
  autoload :Seconds, 'time_of_day_attr/seconds'
  autoload :TimeFormat, 'time_of_day_attr/time_format'
  autoload :TimeOfDay, 'time_of_day_attr/time_of_day'
  autoload :DecimalTime, 'time_of_day_attr/decimal_time'

  require 'i18n'
  I18n.load_path << File.expand_path('../config/locales/time_of_day.en.yml', __dir__)
  I18n.load_path << File.expand_path('../config/locales/time_of_day.de.yml', __dir__)
end

require 'time_of_day_attr/railtie' if defined?(Rails)
