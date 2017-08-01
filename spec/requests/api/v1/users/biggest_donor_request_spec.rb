require 'rails_helper'

RSpec.describe "biggest_donor request" do
  it "can return successful response" do

    user1 = create(:user)
    user2 = create(:user)

    backing1 = create(:project_backer, pledge_amount: 500, user_id: user1.id)
    backing2 = create(:project_backer, pledge_amount: 500, user_id: user1.id)
    backing3 = create(:project_backer, pledge_amount: 1, user_id: user2.id)
    backing4 = create(:project_backer, pledge_amount: 2, user_id: user2.id)


    get '/api/v1/users/biggest_donor'

    binding.pry

    expect(response).to be_success
  end
end
