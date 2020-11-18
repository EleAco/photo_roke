class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.text         :explanation
      t.string       :title,               null: false
      t.integer      :user_id,             null: false, foreign_key: true
      t.float        :latitude,            default: 35.710063
      t.float        :longitude,           default: 139.810700
      t.timestamps   
    end
  end
end