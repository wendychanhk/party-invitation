require 'spec_helper'

describe DistanceCalculator do
  let(:calculator) { DistanceCalculator.new }
  let(:office_latitude) { 53.339428 }
  let(:office_longitude) { -6.257664 }
  let(:customer) { {'latitude' => 52.986375, 'user_id' => 12, 'name' => 'Christina McArdle', 'longitude' => -6.043701} }

  describe '#customer_within_set_distance?' do
    context 'maximum distance is 100km' do
      let(:max_distance) { 100 }
      let(:unit) { 'km' }
      describe 'given customer location and office location' do
        it 'returns truthy when customer is within given maximum distance' do
          expect(calculator.customer_within_set_distance?(customer, office_latitude, office_longitude, max_distance, unit)).to be_truthy
        end
      end
    end

    context 'maximum distance is 10km' do
      let(:max_distance) { 10 }
      let(:unit) { 'km' }
      describe 'given customer location and office location' do
        it 'returns falsy when customer is not within given maximum distance' do
          expect(calculator.customer_within_set_distance?(customer, office_latitude, office_longitude, max_distance, unit)).to be_falsy
        end
      end
    end
  end
end
