class RemoveCitiesFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :city_id
  end
end
