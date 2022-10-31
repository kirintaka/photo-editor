class CreateImagePaths < ActiveRecord::Migration[7.0]
  def change
    create_table :image_paths do |t|
      t.integer :id
      t.string :path

      t.timestamps
    end
  end
end
