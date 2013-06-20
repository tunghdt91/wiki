class Post < ActiveRecord::Base
  attr_accessible :catalog, :content, :user_id
end
