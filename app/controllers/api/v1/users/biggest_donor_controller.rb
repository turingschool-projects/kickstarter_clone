class Api::V1::Users::BiggestDonorController < ApiController

  def show
    render json: User.biggest_donor
  end
end
