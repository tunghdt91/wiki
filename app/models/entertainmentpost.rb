class Entertainmentpost < ActiveRecord::Base
  attr_accessible :content, :user_id,:updated_at, :created_at
  belongs_to :entertainment

  validates :content, presence: true
end
