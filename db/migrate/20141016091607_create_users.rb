class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.float :balance
      t.integer :team_id
      t.integer :attend_count
      t.boolean :vip
      t.text :note
      t.string :password

      t.timestamps
    end
  end
end
