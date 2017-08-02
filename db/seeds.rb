# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

source = NewsSource.create_with(name: ARGV[2]).find_or_create_by(source_code: ARGV[1])

seed_articles = JSON.parse(Typhoeus.get("https://newsapi.org/v1/articles?source=#{source.source_code}&apiKey=5b83fbf74e5d4688afc81078d9afd608").body)["articles"]

seed_articles.each do |article|
  Article.create(news_source: source, author: article["author"],
                 title: article["title"], url: article["url"],
                 published_at: article["publishedAt"], description: article["description"])
end
