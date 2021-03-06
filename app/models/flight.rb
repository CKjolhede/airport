class Flight < ApplicationRecord
  belongs_to :airline

  validates_presence_of :flight_number
  validates_presence_of :destination

  def self.nonstops
    where(nonstop: true)
  end

  def self.alphabetized
    order(:destination)
  end
end
