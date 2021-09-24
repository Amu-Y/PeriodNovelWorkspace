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
    @novel = Novel.new
    @word = Word.new
  end

  private
  def workspace_params
    params.require(:workspace).permit(:noveltitle, :overview)
  end
end
