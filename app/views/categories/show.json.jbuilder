json.array! end_date(@projects) do |project|
  json.image_url project.image_url
  json.slug project.create_slug
  json.title project.title
  json.percentage_pledged project.percentage_pledged.round(0)
  json.total_pledged number_with_delimiter(project.total_pledged, :delimiter => ',')
  json.days_remaining project.days_remaining
  json.project_backers project.project_backers.count
  json.description project.description
end
