class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.integer :marvel_id
      t.string :name
      t.string :thumbnail_image_url

      t.timestamps
    end
  end
end
