class CreateWorkspaces < ActiveRecord::Migration[5.2]
  def change
    create_table :workspaces do |t|
      
      t.integer :user_id
      # 小説タイトル、概要
      t.string :noveltitle
      t.text :overview

      t.timestamps
    end
  end
end
