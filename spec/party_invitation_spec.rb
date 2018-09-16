require 'spec_helper'

describe PartyInvitation do
  let(:invite) { PartyInvitation.new(file_path, office_latitude, office_longitude, max_distance, unit) }
  let(:file_path) { './data/customer-data.txt' }
  let(:office_latitude) { 53.339428 }
  let(:office_longitude) { -6.257664 }
  let(:customers) { invite.output_selected_customers_list }

  describe '#output_selected_customers_list' do
    context 'maximum distance is 100km' do
      let(:max_distance) { 100 }
      let(:unit) { 'km' }

      describe 'returns correct values' do
        it 'returns User ID and names of selected customers' do
          expect(customers.length).to eq(20)
          expect(customers.keys[0]).to eq(4)
          expect(customers.values[0]).to eq('Ian Kehoe')
        end

        it 'returns the users by ascending User ID' do
          expect(customers.keys[0] < customers.keys[1]).to be_truthy
        end
      end
    end

    context 'maximum distance is 50km' do
      let(:max_distance) { 50 }
      let(:unit) { 'km' }

      describe 'returns correct values' do
        it 'returns User ID and names of selected customers' do
          expect(customers.length).to eq(10)
          expect(customers.keys[0]).to eq(4)
          expect(customers.values[0]).to eq('Ian Kehoe')
        end

        it 'returns the users by ascending User ID' do
          expect(customers.keys[0] < customers.keys[1]).to be_truthy
        end
      end
    end

    context 'maximum distance is 5' do
      let(:max_distance) { 5 }
      let(:unit) { 'km' }

      describe 'returns correct values' do
        it 'returns an empty hash' do
          expect(customers).to be_empty
        end
      end
    end
  end
end
