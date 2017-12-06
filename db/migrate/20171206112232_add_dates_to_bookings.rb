class AddDatesToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :date_of_tour, :date
  end
end
