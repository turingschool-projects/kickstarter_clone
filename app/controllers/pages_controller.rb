class PagesController < ApplicationController

  def home
    @categories = Category.all
    @projects = Project.all
    @most_funded = Project.most_funded
  end

  def about; end
end
