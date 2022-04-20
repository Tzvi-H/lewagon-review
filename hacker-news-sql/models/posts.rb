require 'sqlite3'

DB = SQLite3::Database.new("db/posts.db")
DB.results_as_hash = true

class Post
  def self.find(id)
    results = DB.execute("select * from posts where id = ?", id)
    results[0]
  end

  def self.all
    DB.execute("select * from posts")
  end

  def initialize(attributes)
    @id = attributes.id
    @title = attributes.title
    @url = attributes.url
    @votes = attributes.votes
  end
end

puts Post.all()