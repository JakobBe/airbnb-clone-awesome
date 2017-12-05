class AddNightsToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :nights, :integer
  end
end
