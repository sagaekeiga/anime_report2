class CreateLocates < ActiveRecord::Migration
  def change
    create_table :locates do |t|
      t.text :name
      t.text :url
      t.text :pref_cd
      t.float :latitude, limit: 53
      t.float :longitude, limit: 53

      t.timestamps null: false
    end
  end
end
