class RenameColumnsInWorksToMatchCsv < ActiveRecord::Migration[6.0]
  def change
    remove_column :works, :type
    remove_column :works, :name
    remove_column :works, :published

    add_column :works, :category, :string
    add_column :works, :title, :string
    add_column :works, :creator, :string
    add_column :works, :publication_year, :string
    
  end
end
