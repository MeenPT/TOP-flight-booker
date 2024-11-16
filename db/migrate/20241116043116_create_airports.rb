class CreateAirports < ActiveRecord::Migration[7.2]
  def change
    create_table :airports do |t|
      t.string :iata, null: false, index: { unique: true }
      t.string :name, null: false
      t.string :county, null: false
      t.string :location, null: false

      t.timestamps
    end
  end
end
