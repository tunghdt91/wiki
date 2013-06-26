class Dienthoai < ActiveRecord::Base
  attr_accessible :content, :file_name, :file_path, :title, :user_id, :cost, :updated_at
  default_scope order: 'dienthoais.created_at DESC'
end
