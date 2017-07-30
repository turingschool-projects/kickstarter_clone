class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(name: params[:id]) || Category.find(params[:id])
    @projects = @category.projects
    if params[:end_date]
      @projects = end_date(@projects)
    end
    if params[:total_pledged]
      @projects = sort_pledged(@projects)
    end
    if params[:most_funded]
      @projects = sort_funding(@projects)
    end
    if params[:magic]
      @projects = by_magic(@projects)
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
