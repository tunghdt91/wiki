class Post < ActiveRecord::Base

  attr_accessible :topic, :content, :user_id, :topic_id
  default_scope order: 'posts.created_at DESC'
end