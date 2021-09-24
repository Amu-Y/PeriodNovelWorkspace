class CreateNovels < ActiveRecord::Migration[5.2]
  def change
    create_table :novels do |t|
      
      t.integer :workspace_id
      # 小説章、本文
      t.string :chapter
      t.text :novelbody

      t.timestamps
    end
  end
end
