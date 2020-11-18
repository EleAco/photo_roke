class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.text         :explanation
      t.string       :title,               null: false
      t.integer      :user_id,             null: false, foreign_key: true
      t.float        :latitude
      t.float        :longitude
      t.timestamps   
    end
  end
end