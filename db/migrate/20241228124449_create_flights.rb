class CreateFlights < ActiveRecord::Migration[8.0]
  def change
    create_table :flights do |t|
      t.belongs_to :departure_airport, null: false, foreign_key: { to_table: :airports }
      t.belongs_to :arrival_airport, null: false, foreign_key: { to_table: :airports }
      t.datetime :start, null: false
      t.interval :duration, null: false
      t.timestamps
    end
  end
end
