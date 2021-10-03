class NovelsController < ApplicationController
  def create
    @workspace = Workspace.find(params[:workspace_id])
    @novel = Novel.new(novel_params)
    @novel.workspace_id = @workspace.id
    if @novel.save
      redirect_to workspace_novel_path(@workspace, @novel.id)
    else
      flash[:error] = "章タイトルと本文を1文字以上入力して下さい。"
      redirect_back fallback_location: { action: "show", id: 5 }
    end
  end

  def index
    @novels = Novel.all
    @user = current_user
  end

  def new
    @workspace = Workspace.find(params[:workspace_id])
    @novel = Novel.new
    @words = Word.all
    @word = Word.new
  end

  def show
    @workspace = Workspace.find(params[:workspace_id])
    @novel = Novel.find(params[:id])
    @words = Word.all
    @word = Word.new
  end

  def edit
    @workspace = Workspace.find(params[:workspace_id])
    @novel = Novel.find(params[:id])
    @words = Word.all
    @word = Word.new
  end

  def update
    @workspace = Workspace.find(params[:workspace_id])
    @novel = Novel.find(params[:id])
    if @novel.update(novel_params)
      redirect_to workspace_novel_path(@workspace, @novel.id)
    else
      flash[:error] = "章タイトルと本文を1文字以上入力して下さい。"
      redirect_back fallback_location: { action: "show", id: 5 }
    end
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
