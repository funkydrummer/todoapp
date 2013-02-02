class Song < ActiveRecord::Base
  default_scope order('created_at DESC')
  attr_accessible :content, :kind, :is_sample
  validates_presence_of :kind
end
