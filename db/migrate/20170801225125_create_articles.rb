class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :author
      t.string :title
      t.text :title
      t.string :url
      t.datetime :published_at

      t.references :news_source, foreign_key: true

      t.timestamps
    end
  end
end
