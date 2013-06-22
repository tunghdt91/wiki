class Entertainment < ActiveRecord::Base
  attr_accessible :catalog, :content, :title, :picture, :user_post, :viewed,:updated_at, :created_at
  has_many :entertainmentposts, dependent: :destroy

  default_scope order: 'entertainments.updated_at DESC'
end
