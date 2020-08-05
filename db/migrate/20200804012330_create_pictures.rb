class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.text :image
      t.string :title
      t.string :content
      t.timestamps
    end
  end
end
