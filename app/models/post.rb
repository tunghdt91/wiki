class Post < ActiveRecord::Base
  attr_accessible :topic, :content, :user_id
end
