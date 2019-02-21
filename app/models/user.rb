class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :email, email: true

  has_one :address

  has_secure_password

  def name
    first_name + " " + last_name
  end

  def get_rate
    raise "rate not defined for #{self.class}"
  end
end
