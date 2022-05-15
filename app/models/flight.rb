class Flight < ApplicationRecord
  belongs_to :airline

  validates_presence_of :flight_number
  validates_presence_of :destination
  validates_presence_of :nonstop
end
