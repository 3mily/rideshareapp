class AddPassengersTable < ActiveRecord::Migration
  def change
    create_table :passengercommutes do |t|
      t.references :user, index: true #passenger
      t.references :drivercommute, index: true
      t.json :origin
      t.json :destination
      t.time :arrival_time
      t.json :days

      t.timestamps
    end
  end
end
