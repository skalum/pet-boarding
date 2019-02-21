require_relative 'user'

class Sitter < User
  has_many :appointments
  has_many :clients, through: :appointments, class_name: "Owner"
  has_many :pets, through: :appointments

  def money_in_past
    past_appointments.inject(0) {|sum, appt| sum + appt.revenue}
  end

  def money_in_future
    future_appointments.inject(0) {|sum, appt| sum + appt.revenue}
  end

  def past_appointments
    appointments.select do |appt|
      appt.end_date_and_time < Time.now
    end
  end

  def future_appointments
    appointments.select do |appt|
      appt.start_date_and_time > Time.now
    end
  end

  def get_rate
    '%.2f' % rate
  end

end
