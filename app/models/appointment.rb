class Appointment < ActiveRecord::Base
  validates :start_date_and_time, presence: true
  validates :end_date_and_time, presence: true
end
