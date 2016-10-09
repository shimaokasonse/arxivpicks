class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :title
      t.text :abstract
      t.text :url
      t.string :date
      t.string :category

      t.timestamps null: false
    end
  end
end
