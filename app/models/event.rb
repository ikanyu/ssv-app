class Event < ActiveRecord::Base
  belongs_to :admin, class_name: 'User', foreign_key: 'admin_id'
end