class AddTopicToDienthoais < ActiveRecord::Migration
  def change
    add_column :dienthoais, :topic_id, :integer
  end
end
