module ApplicationHelper

  def current_user_nav_element
    if current_user
      render "helpers/logged_in"
    else
      render "helpers/not_logged_in"
    end
  end

  def top_project_card
    if @top_project
      render "helpers/top_project"
    end
  end

  def end_date(projects)
    projects.sort { |a,b| a.days_remaining <=> b.days_remaining }
  end

  def sort_pledged(projects)
    projects.sort { |a,b| b.total_pledged <=> a.total_pledged }
  end

  def sort_funding(projects)
    projects.joins(:project_backers).group(:id).order('sum(pledge_amount)desc')
  end

  def by_magic(projects)
    projects.all.shuffle
  end

end
