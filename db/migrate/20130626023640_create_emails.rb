class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :from_user
      t.string :to_user
      t.string :title
      t.string :content
      t.string :mark_read, default: false

      t.timestamps
    end
  end
end
