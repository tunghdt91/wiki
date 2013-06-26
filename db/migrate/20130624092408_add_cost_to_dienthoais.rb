class AddCostToDienthoais < ActiveRecord::Migration
  def change
    add_column :dienthoais, :cost, :string
  end
end
