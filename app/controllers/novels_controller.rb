class NovelsController < ApplicationController
  def create
    @novel = Novel.new(_params)
    @novel.user_id = current_user.id
    @Novel.save
  end

  def index
    @novel = Novel.new
    @novels = Novel.all
    @user = current_user
  end

  private
  def novel_params
    params.require(:novel).permit(:chapter, :novelbody)
  end
end
