class Entry < ActiveRecord::Base
  attr_accessible  :title, :link, :description,
                   :author, :category, :comments,
                   :enclosure, :guid, :pubDate, :feed_id

  belongs_to :feed, inverse_of: :entries

  validates :title, :link, :description, :feed, :presence => true
end
