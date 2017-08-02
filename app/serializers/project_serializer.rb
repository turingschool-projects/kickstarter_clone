class ProjectSerializer < ActiveModel::Serializer
  attributes :title, :description, :image_url, :target_amount, :completion_date, :location_id
end
