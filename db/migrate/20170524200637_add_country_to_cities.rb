class AddCountryToCities < ActiveRecord::Migration[5.0]
  def change
    add_reference :cities, :country, foreign_key: true
  end
end