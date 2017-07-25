require 'rails_helper'

RSpec.desctibe "user interacts with filter nav-bar" do
  it "user sets the filters they want for projects" do
    visit projects_path
    expect(page).to have_css("filter-nav-bar")
    expect(page).to have_css("category-filter")
    expect(page).to have_css("location-filter")
    expect(page).to have_css("tag-filter")
    expect(page).to have_css("sorting-filter")
    select 'All', from: 'category-filter'
    select 'Denver', from: 'location-filter'
    select 'Artisanal', from: 'tag-filter'
    select 'Magic', from: 'sorting-filter'
  end
end


# Feature: User can use filter nav-bar
# As a user
# When I visit the project index page
# I expect to see a navbar filter
# I expect the page to have dropdown menu for categories
# I expect the page to have dropdown menu for location
# I expect the page to have a dropdown menu for tags
# I expect the page to have a dropdown menu for sorting
# When I select the category dropdown menu for ‘all’
# And I select the location dropdown for ‘Denver’
# And I select the tag dropdown for “Artisanal”
# And I select the sorting to be “magic”
# I expect the page to have a certain amount of projects with these filters applied
# I expect a message at the top of the page to tell me how many results there are
# And I expect the page to have the content project name
# And I expect the page to have the content author name
# And I expect the page to have the content pledge amount
# And I expect the page to have the content percent funded
# And I expect the page to have the content days to go
