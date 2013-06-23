class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :birth_day
      t.string :date_join
      t.string :address
      t.string :sothich
      t.string :caunoiuathich
      t.integer :group
      t.string :level
      t.string :avatar_path,default: '/img/avatar/avatar.png'
      t.string :remember_token 

      t.timestamps
    end
  end
end
