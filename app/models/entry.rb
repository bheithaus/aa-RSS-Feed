class Entry < ActiveRecord::Base
  attr_accessible  :title, :link, :description,
                   :author, :category, :comments,
                   :enclosure, :guid, :pubdate, :feed_id

  belongs_to :feed

  validates :title, :link, :description, :feed, :presence => true
end
