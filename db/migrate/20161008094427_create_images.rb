class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :target_id
      t.string :url
      t.string :type

      t.timestamps null: false
    end
  end
end
