class AddImageToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :image, :string
  end
end
