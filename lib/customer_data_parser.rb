require 'json'

# parse customer text file and process the values into right data type
class CustomerDataParser
  def parse_customer_text_file(file_path)
    results = []
    file = File.open(file_path, 'r')

    file.each_line.map do |line|
      customer = JSON.parse(line)
      processed_customer = process_hash_values(customer)
      results << processed_customer
    end
    results
  end

  private

  def process_hash_values(input_hash)
    input_hash['latitude'] = input_hash['latitude'].to_f
    input_hash['longitude'] = input_hash['longitude'].to_f
    input_hash
  end
end
