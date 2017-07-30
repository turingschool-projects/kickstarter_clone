class MostFundedProjectSerializer < ActiveModel::Serializer
  attributes :title, :description, :image_url, :target_amount, :completion_date, :location_id, :funding_amount

  def funding_amount
    object.total_pledged
  end
end
