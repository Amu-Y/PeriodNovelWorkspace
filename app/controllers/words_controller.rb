class WordsController < ApplicationController

  def create
    @workspace = Workspace.find(params[:workspace_id])
    @word = Word.new(word_params)
    @word.workspace_id = @workspace.id
    @word.save
  end

  def show
    @workspace = Workspace.find(params[:workspace_id])
    @word = Word.find(params[:word_id])
  end

  def edit
    @workspace = Workspace.find(params[:workspace_id])
    @word = Word.find(params[:word_id])
  end

  def update
    @workspace = Workspace.find(params[:workspace_id])
    @word = Word.find(params[:id])
    @word.update
  end

  def destroy
    @workspace = Workspace.find(params[:workspace_id])
    @word = Word.find(params[:id])
    @word.destroy
  end

  private
  def word_params
    params.require(:word).permit(:word, :commentary)
  end
end
