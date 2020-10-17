class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.text         :explanation,         null: false
      t.timestamps
    end
  end
end
