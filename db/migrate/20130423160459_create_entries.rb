class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string      :title,       :null => false
      t.text        :link,        :null => false
      t.string      :description, :null => false
      t.string      :author
      t.string      :category
      t.text        :comments
      t.text        :enclosure
      t.string      :guid
      t.string      :pubDate
      t.references  :feed

      t.timestamps
    end
  end
end
