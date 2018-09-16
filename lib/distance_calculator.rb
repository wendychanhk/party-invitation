require 'geocoder'

# calculate distance between customer and any given location and return
# whether the distance is within the given maximum distance
class DistanceCalculator
  def customer_within_set_distance?(
    customer,
    office_latitude,
    office_longitude,
    max_distance,
    unit
  )
    distance(customer, office_latitude, office_longitude, unit) < max_distance
  end

  private

  def distance(customer, office_latitude, office_longitude, unit)
    point1 = customer_location(customer)
    point2 = [office_latitude, office_longitude]
    unit = unit.to_sym
    calculate_distance(point1, point2, units: unit)
  end

  def customer_location(customer)
    lat = customer['latitude']
    long = customer['longitude']
    [lat, long]
  end

  # calculate distance between two points on Earth using Haversine formula
  # options can be units of distance (eg. km, mi)
  def calculate_distance(point1, point2, _options = {})
    Geocoder::Calculations.distance_between(point1, point2, _options = {})
  end
end
