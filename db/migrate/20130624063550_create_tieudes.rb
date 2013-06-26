class CreateTieudes < ActiveRecord::Migration
  def change
    create_table :tieudes do |t|
      t.string :name

      t.timestamps
    end
  end
end
