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

  it "can get one project by its id" do
    project = create(:project)

    get "/api/v1/projects/#{project.id}"


    project_hash = JSON.parse(response.body)

    expect(response).to be_success
    expect(project_hash["title"]).to eq(project.title)
  end
end
