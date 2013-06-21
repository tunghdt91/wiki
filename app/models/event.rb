class Event < ActiveRecord::Base
  attr_accessible :address, :name, :time_start, :time_end
    default_scope order: 'events.created_at DESC'
end
