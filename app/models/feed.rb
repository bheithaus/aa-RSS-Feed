class Feed < ActiveRecord::Base
  attr_accessible :title, :link, :description,
                  :language, :copyright, :managing_editor,
                  :web_master, :pub_date, :last_build_date,
                  :category, :generator, :docs, :ttl, :image,
                  :skip_hours, :skip_days

  has_many :entries

  validates :title, :link, :description, :presence => true
end