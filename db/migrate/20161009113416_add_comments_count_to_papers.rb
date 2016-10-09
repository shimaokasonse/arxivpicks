class AddCommentsCountToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :comments_count, :integer, default: 0
  end
end
