class Entertainment < ActiveRecord::Base
  attr_accessible :catalog, :content, :title, :picture
  default_scope order: 'entertainments.created_at DESC'
end
