class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    if Location.find_by(postal_code: params['location']['postal_code']) == nil #ActiveRecord NotFound??
      @location = Location.new(location_params)
      if @location.save
        redirect_to new_project_path(location_id: @location.id)
      else
        flash[:notice] = "Alert: Please input required fields."
        redirect_to new_location_path
      end
    else
      @location = Location.find_by(postal_code: params['location']['postal_code'])
      redirect_to new_project_path(location_id: @location.id)
    end
  end

  private
    def location_params
      params.require(:location).permit(:postal_code, :city, :country)
    end
end
