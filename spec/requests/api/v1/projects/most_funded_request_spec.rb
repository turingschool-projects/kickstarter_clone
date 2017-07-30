require 'rails_helper'

RSpec.describe "most_funded request" do
  it "can return successful response" do
    create_list(:project, 3)

    get '/api/v1/projects/most_funded'

    expect(response).to be_success
  end
end
