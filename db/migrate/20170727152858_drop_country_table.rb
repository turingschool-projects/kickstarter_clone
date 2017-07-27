class DropCountryTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :countries
  end
end
