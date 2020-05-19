class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.string :type
      t.string :name
      t.date :published
      t.string :description

      t.timestamps
    end
  end
end
