require_relative 'user'

class Sitter < User
  has_many :appointments
  has_many :clients, through: :appointments, class_name: "Owner"
  has_many :pets, through: :appointments
end
