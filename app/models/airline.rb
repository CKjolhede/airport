class Airline < ApplicationRecord
  has_many :flights, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :rating

  
  def self.sort_by_creation
    order(created_at: :asc)
  end

  def flights_count
    flights.count
  end
  
end