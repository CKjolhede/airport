class RemoveAirlineColumn < ActiveRecord::Migration[5.2]
  def change 
    change_table :airlines do |t|
    t.remove :true
    end
  end
end
