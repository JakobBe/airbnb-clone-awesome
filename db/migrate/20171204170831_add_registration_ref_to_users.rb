class AddRegistrationRefToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :registration, foreign_key: true
  end
end
