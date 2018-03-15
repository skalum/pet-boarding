require 'smartystreets_ruby_sdk/static_credentials'
require 'smartystreets_ruby_sdk/client_builder'
require 'smartystreets_ruby_sdk/us_street/lookup'

class Address < ActiveRecord::Base
  belongs_to :user

  def correct_address
    if new_address = Address.lookup(self)
      self.update(new_address)
      return true
    end

    return false
  end

  private

  def self.lookup(address)
    auth_id = '5589b297-75d7-5e8e-5360-5a1793fec31c'
		auth_token = '65abkDxmKjTuDCWT37Rz'

    credentials = SmartyStreets::StaticCredentials.new(auth_id, auth_token)

    client = SmartyStreets::ClientBuilder.new(credentials).build_us_street_api_client

    lookup = SmartyStreets::USStreet::Lookup.new
    lookup.street = address.line_1
    lookup.city = address.city
    lookup.state = address.state
    lookup.zipcode = address.zip

    begin
			client.send_lookup(lookup)
		rescue SmartyStreets::SmartyError => err
			puts err
			return
		end

		result = lookup.result

		if result.empty?
			puts 'No candidates. This means the address is not valid.'
			return
		end

		first_candidate = result[0]

    found_address = {}
    found_address["line_1"] = first_candidate.delivery_line_1
    found_address["line_2"] = first_candidate.delivery_line_2
    found_address["city"] = first_candidate.components.city_name
    found_address["state"] = first_candidate.components.state_abbreviation
    found_address["zip"] = first_candidate.components.zipcode

    found_address
  end

end
