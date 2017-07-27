require 'rails_helper'

describe "user can create a project" do
  before :each do
    create(:project)
  end
  context "when a user is logged in" do
    it "user can create a new project" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit root_path
      within('.nav-wrapper') do
        click_on "Start a project"

        expect(current_path).to eq new_location_path
      end

      fill_in "Postal Code", with: "81625"
      fill_in "City", with: "Craig"
      fill_in "Country", with: "United States"
      click_on "Continue to Project"

      expect(current_path).to eq(new_project_path)
      expect(page).to have_content("Tell Us About Your Project")

      fill_in "Title", with: "Artisan Firewood"
      fill_in "Description", with: "Curated Firewood"
      fill_in "Image", with: "wwww.google.com"
      fill_in "Target Amount", with: "3000"
      select "Art", from: "Categories"
      select "2018", from: "project[completion_date(1i)]"
      select "August", from: "project[completion_date(2i)]"
      select "26", from: "project[completion_date(3i)]"
      click_on "Continue to Rewards"

      expect(current_path).to eq(new_reward_path)
      expect(page).to have_content("How Will You Reward Your Donors?")

      fill_in "Title", with: "Firewood Bundle"
      fill_in "Description", with: "Bespoke"
      fill_in "Pledge Amount", with: "300"
      fill_in "Pledge Amount", with: "300"
      fill_in "Limit", with: "4"
      click_on "Finish Creating Project"

      expect(current_path).to eq(project_path(Project.last))
  end
end
