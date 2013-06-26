class Myfile < ActiveRecord::Base
  attr_accessible :name, :name_display, :user_id
  default_scope order: 'created_at DESC'
end
