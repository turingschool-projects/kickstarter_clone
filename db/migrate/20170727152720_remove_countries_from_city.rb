class RemoveCountriesFromCity < ActiveRecord::Migration[5.0]
  def change
    remove_column :cities, :country_id
  end
end
