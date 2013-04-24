class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string      :title,       :null => false
      t.text        :link,        :null => false
      t.string      :description, :null => false
      t.string      :language
      t.string      :copyright
      t.string      :managingEditor
      t.string      :webMaster
      t.date        :pubDate
      t.date        :lastBuildDate
      t.string      :category
      t.string      :generator
      t.string      :docs
      t.integer     :ttl
      t.text        :image
      t.integer     :skipHours
      t.integer     :skipDays
      t.timestamps
    end
  end
end
