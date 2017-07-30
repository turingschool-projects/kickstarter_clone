require 'rails_helper'

RSpec.describe "location with most projects request" do
  xit "can return successful response" do

    location1 = create(:location)
    location2 = create(:location)

    project1 = create(:project, location_id: location1.id)
    project2 = create(:project, location_id: location1.id)
    project3 = create(:project, location_id: location2.id)

    get '/api/v1/locations/location_with_most_projects'

    expect(response).to be_success

    #binding.pry
  end
end
