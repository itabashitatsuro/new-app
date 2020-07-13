class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.text :content
      t.date :date
      t.string :image

      t.timestamps
    end
  end
end
