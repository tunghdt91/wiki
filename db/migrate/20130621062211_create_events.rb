class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :address
      t.date :time_start
      t.date :time_end

      t.timestamps
    end
  end
end
