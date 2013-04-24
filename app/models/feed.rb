# encoding: UTF-8

require 'open-uri'

class Feed < ActiveRecord::Base
  attr_accessible :title, :link, :description,
                  :language, :copyright, :managingEditor,
                  :webMaster, :pubDate, :lastBuildDate,
                  :category, :generator, :docs, :ttl, :image,
                  :skipHours, :skipDays, :url

  has_many :entries, inverse_of: :feed

  validates :title, :link, :description, :presence => true

  def self.new_feed(url)
    rss = SimpleRSS.parse(open(url))

    feed = Feed.new(title: rss.title, description: rss.description, link: rss.link, url: url)

    rss.items.each do |item|
      p accepted_attributes(item)
      feed.entries.new(accepted_attributes(item))
    end

    feed
  end

  def self.accepted_attributes(item)
    item_params = {}
    Entry.accessible_attributes.each do |attr|
      next if attr == ""
      item_params[attr.to_sym] = scrub_field(item[attr.to_sym])
    end
    item_params
  end

  def self.scrub_field(field)
    field ||= ''
    field.to_s.encode('ASCII', :invalid => :replace, :undef => :replace)
  end

  def latest_entries
    guids = self.entries.map { |entry| entry.guid }

    SimpleRSS.parse(open(self.url)).items.each do |item|

      unless guids.include?(item[:guid])
        self.entries.create!(Feed.scrub_field(Feed.accepted_attributes(item)))
      end
    end

    nil
  end
end