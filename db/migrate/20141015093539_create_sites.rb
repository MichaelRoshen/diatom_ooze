class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :address
      t.float :price
      t.text :note

      t.timestamps
    end
  end
end
