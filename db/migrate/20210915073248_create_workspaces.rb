class CreateWorkspaces < ActiveRecord::Migration[5.2]
  def change
    create_table :workspaces do |t|
      
      # 小説タイトル、本文
      t.string :noveltitle
      t.text :novel

      t.timestamps
    end
  end
end
