require 'spec_helper'

describe CustomerDataParser do
  describe '#parse_customer_text_file' do
    let(:parser) { CustomerDataParser.new }
    let(:customers) { parser.parse_customer_text_file(file_path) }
    let(:file_path) { './data/customer-data.txt' }
    it 'returns customers in hashes and returns latitude and longitude as float' do
      expect(customers.length).to eq(32)
      expect(customers.first).to eq(
        'latitude' => 52.986375,
        'user_id' => 12,
        'name' => 'Christina McArdle',
        'longitude' => -6.043701
      )
    end
  end
end
