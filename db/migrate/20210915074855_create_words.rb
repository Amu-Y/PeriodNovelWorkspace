class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      
      # 単語とその解説
      t.string :word
      t.text :commentary

      t.timestamps
    end
  end
end
