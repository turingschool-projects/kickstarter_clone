class LocationSerializer < ActiveModel::Serializer
  attributes :postal_code, :city, :country
end
