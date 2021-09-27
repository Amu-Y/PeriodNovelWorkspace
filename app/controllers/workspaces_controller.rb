class WorkspacesController < ApplicationController
  def create
    @workspace = Workspace.new(workspace_params)
    @workspace.user_id = current_user.id
    @workspace.save
    redirect_to workspace_path(@workspace.id)
  end

  def index

    @workspaces = Workspace.all

  end

  def new
    @workspace = Workspace.new
    @user = current_user
  end

  def show
    @user = current_user
    @workspace = Workspace.find(params[:id])
    @novels = Novel.all
    @words = Word.all
    @word = Word.new
  end

  def edit
    @workspace = Workspace.find(params[:id])
  end

  def update
    @workspace = Workspace.find(params[:id])
    @workspace.update(workspace_params)
    redirect_to workspace_path(@workspace.id)
  end


  private
  def workspace_params
    params.require(:workspace).permit(:noveltitle, :overview)
  end
end
