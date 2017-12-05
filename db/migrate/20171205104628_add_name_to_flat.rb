class AddNameToFlat < ActiveRecord::Migration[5.0]
  def change
    add_column :flats, :name, :string
  end
end
