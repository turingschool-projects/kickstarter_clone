require 'rails_helper'

RSpec.describe "a user can sort objects" do
  it "by selecting end date" do
    category = create(:category, name: "Art")
    project1 = create(:project, completion_date: "2017-11-19 00:00:00", title: "Jake the Dog")
    project2 = create(:project, completion_date: "2017-10-19 00:00:00", title: "Finn the Human")
    project3 = create(:project, completion_date: "2017-09-19 00:00:00", title: "Lumpy Space Princess")

    category.projects << [project1, project2, project3]

    visit category_path(category)

    click_on "End Date"

    expect(current_path).to eq(category_path(category))

    within first(".card") do
      expect(page).to have_content("Lumpy Space Princess")
    end

    within all(".card").last do
      expect(page).to have_content("Jake the Dog")
    end
  end
end
