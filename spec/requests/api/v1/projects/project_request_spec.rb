require 'rails_helper'

RSpec.describe "Projects API" do
  it "sends a list of projects" do
    create_list(:project, 3)

    get '/api/v1/projects'

    expect(response).to be_success
    response_keys = JSON.parse(response.body).first.keys

    # expect(response_keys).to include('id')
    # expect(response_keys).to include('name')
    # expect(response_keys).to include('zip')
    # expect(response_keys).to include('description')
    # expect(response_keys).to include('image_url')
  end

  xit "can get one project by its id" do
    id = create(:project).id

    get "/api/v1/projects/#{id}"

    project = JSON.parse(response.body)

    expect(response).to be_success
    expect(project["id"]).to eq(id)
  end
end
