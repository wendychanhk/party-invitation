require_relative 'customer_data_parser'
require_relative 'distance_calculator'

# take in conditions of the party invitation and return chosen customers
class PartyInvitation
  attr_reader :office_latitude, :office_longitude, :max_distance, :unit

  def initialize(file_path, office_latitude, office_longitude, max_distance, unit)
    @file_path = file_path
    @office_latitude = office_latitude
    @office_longitude = office_longitude
    @max_distance = max_distance
    @unit = unit
  end

  def output_selected_customers_list
    sorted_users = sort_users_by_id(selected_customers_list)
    puts 'No customers are within the given maximum distance.' if sorted_users.empty?
    sorted_users.each do |id, name|
      puts "#{name} (User Id: #{id})\n"
    end
  end

  private

  # return customers who are eligible for the invitation
  def selected_customers_list
    guests = {}
    customers = CustomerDataParser.new.parse_customer_text_file(@file_path)
    customers.each do |customer|
      guests[customer['user_id']] = customer['name'] if within_distance(customer)
    end
    guests
  end

  # sort users by ascending User ID
  def sort_users_by_id(users)
    Hash[users.sort]
  end

  def within_distance(customer)
    DistanceCalculator.new.customer_within_set_distance?(
      customer,
      @office_latitude,
      @office_longitude,
      @max_distance,
      @unit
    )
  end
end
