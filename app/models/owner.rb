require_relative 'user'

class Owner < User
  has_many :pets
end
