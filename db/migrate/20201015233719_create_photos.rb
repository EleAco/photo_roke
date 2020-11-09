class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.text         :explanation,         null: false
      t.string       :title,               null: false
      t.integer      :user_id,             null: false, foreign_key: true
      t.float        :latitude,            null: false
      t.float        :longitude,           null: false
      t.timestamps   
    end
  end
end