require 'sqlite3'

DB = SQLite3::Database.new("../db/posts.db")
DB.results_as_hash = true

class Post
  attr_accessor :id, :title, :url, :votes

  def initialize(attributes)
    @id = attributes[:id] || attributes["id"]
    @title = attributes[:title] || attributes["title"]
    @url = attributes[:url] || attributes["url"]
    @votes = attributes[:votes] || attributes["votes"]
  end

  def destroy
    DB.execute("delete from posts where id = ?", self.id)
  end

  def save
    if self.id 
      DB.execute("UPDATE posts SET title = ?, url = ?, votes = ? WHERE id = ?", self.title, self.url, self.votes, self.id)
    else
      DB.execute("INSERT INTO posts (title, url, votes) VALUES (?, ?, ?)", self.title, self.url, self.votes)
      self.id = DB.last_insert_row_id
    end
  end

  def self.find(id)
    result = DB.execute("select * from posts where id = ?", id)[0]  
    Post.new(result) if result
  end

  def self.all
    DB.execute("select * from posts")
  end
end