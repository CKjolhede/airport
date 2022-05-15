class Airline < ApplicationRecord
  has_many :Flight

  validate_presence_of :name
  validate_presence_of :delays
  validate_presence_of :rating
  

end
