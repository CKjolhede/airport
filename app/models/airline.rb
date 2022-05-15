class Airline < ApplicationRecord
  has_many :flights

  validates_presence_of :name
  validates_presence_of :rating

end
