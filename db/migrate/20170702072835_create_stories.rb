class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :s_title
      t.text :w_title
      t.text :url
      t.text :matching

      t.timestamps null: false
    end
  end
end
