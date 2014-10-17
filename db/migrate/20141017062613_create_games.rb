class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :site_id
      t.date :game_date
      t.integer :start_time
      t.integer :end_time
      t.string :status
      t.integer :attend_count

      t.timestamps
    end
  end
end
