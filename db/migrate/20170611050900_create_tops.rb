class CreateTops < ActiveRecord::Migration[5.1]
  def change
    create_table :tops do |t|
      t.string :url
      t.string :name
      t.integer :money
      t.string :site

      t.timestamps
    end
  end
end
