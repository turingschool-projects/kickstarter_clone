class MostFundedProjectSerializer < ActiveModel::Serializer
  attributes :title, :description, :image_url, :completion_date, :location_id, :target_amount, :funding_amount

  def funding_amount
    object.total_pledged
  end
end
