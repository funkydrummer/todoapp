class Song < ActiveRecord::Base
  default_scope order('created_at DESC')
  attr_accessible :content, :kind
end
