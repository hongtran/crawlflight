class AddAirlineTypeToTotalFlights < ActiveRecord::Migration[5.0]
  def change
    add_column :total_flights, :airline_type, :string
  end
end
