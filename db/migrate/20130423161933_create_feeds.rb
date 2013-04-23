class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string      :title,       :null => false
      t.text        :link,        :null => false
      t.string      :description, :null => false
      t.string      :language
      t.string      :copyright
      t.string      :managing_editor
      t.string      :web_master
      t.date        :pub_date
      t.date        :last_build_date
      t.string      :category
      t.string      :generator
      t.string      :docs
      t.integer     :ttl
      t.text        :image
      t.integer     :skip_hours
      t.integer     :skip_days
      t.timestamps
    end
  end
end
