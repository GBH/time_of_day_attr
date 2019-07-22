class BusinessHour < ActiveRecord::Base
  include TimeOfDayAttr::ActiveRecordExtension

  time_of_day_attr :opening, :closing
end
