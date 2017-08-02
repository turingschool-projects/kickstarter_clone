class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :total_pledged
end
