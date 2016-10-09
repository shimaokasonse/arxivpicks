class AddHeadlineToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :headline, :string
  end
end
