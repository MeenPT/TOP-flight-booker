class CreateAirports < ActiveRecord::Migration[8.0]
  def change
    create_table :airports do |t|
      t.string :iata, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
