class Entertainment < ActiveRecord::Base
  attr_accessible :catalog, :content, :title, :picture, :user_post, :viewed
  default_scope order: 'entertainments.created_at DESC'
end
