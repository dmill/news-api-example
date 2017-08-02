class NewsSource < ApplicationRecord
  has_many :articles

  validates_presence_of :source_code

  after_create :fetch_articles

  def fetch_articles
    seed_articles = JSON.parse(Typhoeus.get("https://newsapi.org/v1/articles?source=#{self.source_code}&apiKey=5b83fbf74e5d4688afc81078d9afd608").body)["articles"]

    seed_articles.each do |article|
      Article.create(news_source: self, author: article["author"],
                     title: article["title"], url: article["url"],
                     published_at: article["publishedAt"], description: article["description"])
    end
  end
end
