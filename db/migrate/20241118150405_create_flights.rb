class CreateFlights < ActiveRecord::Migration[8.0]
  def change
    create_table :flights do |t|
      t.interval :duration, null: false
      t.datetime :depart_at, null: false
      t.belongs_to :departure_airport, foreign_key: { to_table: :airports }
      t.belongs_to :arrival_airport, foreign_key: { to_table: :airports }

      t.timestamps
    end
  end
end
