class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(name: params[:id])
    @projects = @category.projects
    if params[:newest]
      @projects = end_date(@projects)
    end
  end

  def end_date(projects)
    projects.sort { |a,b| a.days_remaining <=> b.days_remaining }
  end

end
