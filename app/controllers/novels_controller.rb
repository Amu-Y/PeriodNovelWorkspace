class NovelsController < ApplicationController
  def create
    @workspace = Workspace.find(params[:workspace_id])
    @novel = Novel.new(novel_params)
    @novel.workspace_id = @workspace.id
    @novel.save
    redirect_to workspace_novel_path(@workspace, @novel.id)
  end

  def index

    @novels = Novel.all
    @user = current_user
  end

  def new
    @workspace = Workspace.find(params[:workspace_id])
    @novel = Novel.new
  end

  def show
    @workspace = Workspace.find(params[:workspace_id])
    @novel = Novel.find(params[:id])
  end

  def edit
    @workspace = Workspace.find(params[:workspace_id])
    @novel = Novel.find(params[:id])
  end

  def update
    @workspace = Workspace.find(params[:workspace_id])
    @novel = Novel.find(params[:id])
    @novel.update(novel_params)
    redirect_to workspace_novel_path(@workspace, @novel.id)
  end

  def destroy
    @workspace = Workspace.find(params[:workspace_id])
    @novel = Novel.find(params[:id])
    @novel.destroy
    redirect_to workspace_path(@workspace.id)
  end

  private
  def novel_params
    params.require(:novel).permit(:chapter, :novelbody)
  end
end
