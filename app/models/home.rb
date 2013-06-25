class Home < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :viewed, :comment
  has_many :homecomments, dependent: :destroy
  
  validates :title, presence: true
  validates :content, presence: true

  default_scope order: 'created_at DESC'
end
