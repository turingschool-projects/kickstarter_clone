class ProjectsController < ApplicationController
  before_action :require_login, only: [:new]
  before_action :set_categories, only: [:new]
  before_action :set_countries, only: [:new]

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    binding.pry
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to new_reward_path(project_id: @project.id)
    else
      redirect_to new_project_path
      flash[:warning] = "Please fill in all fields."
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  private
    def project_params
      city = City.find_or_create_by(name: params[:city])
      city.country_id ||= params[:country_id]

      params.require(:project).permit(:title,
                                      :description,
                                      :image_url,
                                      :target_amount,
                                      :category_id,
                                      :completion_date).merge(city_id: city.id)
    end

    def set_categories
      @categories = Category.category_list
    end

    def set_countries
      @countries = Country.country_list
    end
end
