class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.text :title
      t.text :url
      t.text :youtube
      t.text :ani
      t.text :hima
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
