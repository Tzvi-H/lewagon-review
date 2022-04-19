require "sqlite3"
db = SQLite3::Database.new("./jukebox.sqlite")

def detailed_tracks(db)
  query = <<~SQL
    SELECT t.name, ar.name, al.title
    FROM tracks AS t
    JOIN albums AS al ON al.id = t.album_id
    JOIN artists AS ar ON ar.id = al.artist_id
    LIMIT 10
  SQL

  return db.execute(query)
end

def stats_on(db, genre)
  query = <<~SQL
    SELECT count(t.id), AVG(t.milliseconds) / (60 * 1000)
    FROM tracks AS t 
    JOIN genres AS g ON t.genre_id = g.id
    WHERE g.name = "#{genre}"
  SQL

  stats = db.execute(query)

  return { 
    category: genre,
    number_of_songs: stats[0][0],
    avg_length: stats[0][1].round(1)
  } 
end

# => {
# category: "Rock",
# number_of_songs: 1297,
# avg_length: 4.7
# }

# Find the top 5 artists that made the most songs in a given genre. This method should return an 
# array of arrays with this artist id, the artist name and the number of songs of the given genre for each artist.

def top_five_artists(db, genre)
  query = <<~SQL
    SELECT ar.id, ar.name, count(t.id) AS tcount
    FROM tracks AS t
    JOIN albums AS al ON al.id = t.album_id
    JOIN artists AS ar ON ar.id = al.artist_id
    JOIN genres AS g ON t.genre_id = g.id
    WHERE g.name = "#{genre}"
    GROUP BY ar.id
    ORDER BY tcount DESC
    LIMIT 5
  SQL

  return db.execute(query)
end

#top_five_artists(db, 'Rock')
# => [
# [ 22, 'Led Zeppelin', 114 ], # Led Zeppelin has 114 Rock songs.
# [ 150, 'U2', 112 ]
# etc.
# ]