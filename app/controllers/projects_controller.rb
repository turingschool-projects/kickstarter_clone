class ProjectsController < ApplicationController
  before_action :require_login, only: [:new]
  before_action :set_categories, only: [:new]

  def show
    @project = Project.find(params[:slug])
  end

  def new
    @project = Project.new
  end

  def create
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
        params.require(:project).permit(:title,
                                      :description,
                                      :image_url,
                                      :target_amount,
                                      :category_id,
                                      :completion_date,
                                      :location_id)
    end

    def set_categories
      @categories = Category.category_list
    end
end
