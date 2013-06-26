class Email < ActiveRecord::Base
  attr_accessible :content, :from_user, :mark_read, :title, :to_user
end
