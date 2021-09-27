class WordsController < ApplicationController

  def create
    @workspace = Workspace.find(params[:workspace_id])
    @word = Word.new(word_params)
  end

  def update
    @workspace = Workspace.find(params[:workspace_id])
  end

  def destroy
    @workspace = Workspace.find(params[:workspace_id])
  end

  private
  def word_params
    params.require(:word).permit(:word, :commentary)
  end
end
