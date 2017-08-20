class ProjectsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]
  
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
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
    @project = Project.friendly.find(params[:id])
  end

  def edit
    @project = Project.friendly.find(params[:id])
  end

  def update
    @project = Project.friendly.find(params[:id])
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.friendly.find(params[:id])
    @project.destroy

    redirect_to portfolio_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :github_link, :site_link, :description, :image)
  end
end
