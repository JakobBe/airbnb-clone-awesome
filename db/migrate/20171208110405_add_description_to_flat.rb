class AddDescriptionToFlat < ActiveRecord::Migration[5.0]
  def change
    add_column :flats, :description, :text
  end
end
