class ChangeAirlineColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:airlines, :on_time, from: true, to: 'true')
  end
end
