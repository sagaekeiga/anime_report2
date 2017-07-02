class CreateBots < ActiveRecord::Migration
  def change
    create_table :bots do |t|
      t.text :name
      t.text :matching
      t.text :url

      t.timestamps null: false
    end
  end
end
