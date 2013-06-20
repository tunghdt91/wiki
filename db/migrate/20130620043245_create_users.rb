class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :birth_day
      t.string :date
      t.integer :group
      t.string :level
      t.string :integer
      t.string :avatar_path,default: '/img/avatar.png'
      t.string :remember_token 

      t.timestamps
    end
     add_index :users, [:remember_token]
  end
end
