require 'rails_helper'

RSpec.describe "most_funded request" do
  it "can return successful response" do

    project_list = create_list(:project, 3)
    project = project_list.first
    backer = create(:project_backer, project_id: project.id)

    get '/api/v1/projects/most_funded'

    expect(response).to be_success
  end
end
