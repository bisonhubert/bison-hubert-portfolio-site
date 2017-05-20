class ProjectsController < ApplicationController
  def new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.all
  end

  def update
    
  end

  private
    def project_params
      params.require(:project).permit(:title, :description, :image, :demo_link, :github_link)
    end
end
