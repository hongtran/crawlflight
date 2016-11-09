class CreateTotalFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :total_flights do |t|
      t.references :route, foreign_key: true
      t.references :plane_category, foreign_key: true
      t.datetime :date_depart
      t.string :code_flight
      t.string :time_depart
      t.string :time_arrive
      t.decimal :price_web
      t.decimal :price_adult
      t.decimal :price_child
      t.decimal :price_infant
      t.decimal :price_total

      t.timestamps
    end
  end
end
