class AddCommentIdToDienthoais < ActiveRecord::Migration
  def change
    add_column :dienthoais, :comment_id, :string
  end
end
