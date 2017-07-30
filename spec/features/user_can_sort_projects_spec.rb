require 'rails_helper'

RSpec.describe "a user can sort objects" do
  it "by selecting end date" do
    category = create(:category, name: "Art")
    project1 = create(:project, completion_date: "2017-11-19 00:00:00", name: "Jake the Dog")
    project1 = create(:project, completion_date: "2017-10-19 00:00:00", name: "Finn the Human")
    project1 = create(:project, completion_date: "2017-09-19 00:00:00", name: "Lumpy Space Princess")

    visit category_path(category)

    select "End Date", from: sorting

    expect(current_path).to eq(category_path(category))

    within first(".card") do
      expect(page).to have content("Lumpy Space Princess")
    end

    within all(".card").last do
      expect(page).to have content("Jake the Dog")
    end
    
  end
end
