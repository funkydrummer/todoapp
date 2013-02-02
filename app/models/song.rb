class Song < ActiveRecord::Base
  default_scope order('created_at DESC')
  attr_accessible :content, :kind, :page_title
  validates_presence_of :kind
end
