class Appointment < ActiveRecord::Base
  validates :start_date_and_time, presence: true
  validates :end_date_and_time, presence: true

  def days
    (end_date_and_time - start_date_and_time)/60 /60 /24
  end

  def revenue
    days * rate
  end

end
