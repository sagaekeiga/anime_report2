class CreateAnimes < ActiveRecord::Migration
  def change
    create_table :animes do |t|
      t.text :name
      t.text :title
      t.text :youtube
      t.text :fc2
      t.text :ani
      t.text :hima
      t.text :gogo
      t.text :nova
      t.text :gooda
      t.text :kiss
      t.text :myvi
      t.text :b9
      t.text :daily
      t.text :miomio
      t.text :smove
      t.text :para
      
      t.timestamps null: false
    end
  end
end
