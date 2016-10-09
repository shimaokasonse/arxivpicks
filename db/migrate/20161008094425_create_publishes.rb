class CreatePublishes < ActiveRecord::Migration
  def change
    create_table :publishes do |t|
      t.integer :author_id
      t.integer :paper_id
      t.integer :order

      t.timestamps null: false
    end
  end
end
