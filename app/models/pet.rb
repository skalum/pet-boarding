class Pet < ActiveRecord::Base
  belongs_to :owner
  has_many :appointments
  has_many :sitters, through: :appointments
end
