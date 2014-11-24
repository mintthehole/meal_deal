class Timing < ActiveRecord::Base
  attr_accessible :end_time,:start_time
  validates_presence_of :start_time,:end_time
end
