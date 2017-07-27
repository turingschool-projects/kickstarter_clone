class CreateLocationsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :postal_code
      t.string :city
      t.string :country
    end
  end
end
