class Homecomment < ActiveRecord::Base
  attr_accessible :content, :home_id, :user_id
  belongs_to :home

  validates :content, presence: true
end
