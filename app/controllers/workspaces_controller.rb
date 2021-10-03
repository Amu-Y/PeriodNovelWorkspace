class WorkspacesController < ApplicationController
  def create
    @workspace = Workspace.new(workspace_params)
    @workspace.user_id = current_user.id
    if @workspace.save
      redirect_to workspace_path(@workspace.id)
    else
      render "workspaces/new"
    end
  end

  def index
    @user = current_user
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
    @words = Word.all
    @word = Word.new
  end

  def update
    @workspace = Workspace.find(params[:id])
    if @workspace.update(workspace_params)
      redirect_to workspace_path(@workspace.id)
    else
      flash[:error] = "小説タイトルとあらすじを1文字以上入力して下さい。"
      redirect_back fallback_location: { action: "show", id: 5 }
    end
  end


  private
  def workspace_params
    params.require(:workspace).permit(:noveltitle, :overview)
  end
end
