class Post < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :topic, :content, :user_id, :topic_id
  default_scope order: 'posts.created_at DESC'
=======
  attr_accessible :topic, :content, :user_id
>>>>>>> 12db23413bc4a98c1745f99194fa71542f3ca445
end
