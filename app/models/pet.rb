class Pet < ActiveRecord::Base
  belongs_to :owner
  has_many :appointments
  has_many :sitters, through: :appointments

  def age
    now = Time.current.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
