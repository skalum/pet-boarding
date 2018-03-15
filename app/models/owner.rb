require_relative 'user'

class Owner < User
  has_many :pets
  has_many :appointments, through: :pets
end
