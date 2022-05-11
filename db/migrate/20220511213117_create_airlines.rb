class CreateAirlines < ActiveRecord::Migration[5.2]
  def change
    create_table :airlines do |t|
      t.string :name
      t.boolean :delays
      t.integer :rating

      t.timestamps
    end
  end
end
