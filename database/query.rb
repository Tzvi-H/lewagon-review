require "sqlite3"
db = SQLite3::Database.new("./jukebox.sqlite")

def query_database(db, query)
  results = db.execute(query)
  return results
end

def table_row_count(db, table_name)
  results = db.execute("SELECT count(*) FROM #{table_name}")
  return results[0][0]
end

query1 = <<~SQL
  SELECT count(*)
  FROM artists
SQL

query3 = <<~SQL
  SELECT name
  FROM artists
  ORDER BY name
SQL

# 4. Find all the love songs (i.e the tracks that contain “love” anywhere in their name). Hint: use the WHERE and LIKE SQL keywords.
query4 = <<~SQL
  SELECT name
  FROM tracks
  WHERE name LIKE "%love%"
SQL

def tracks_longer_than(db, seconds)
  milliseconds = (seconds * 1000)

  return db.execute("SELECT name, milliseconds / 1000 FROM tracks WHERE milliseconds > #{milliseconds} ORDER BY milliseconds")
end
puts tracks_longer_than(db, 18000)

# 1. How many rows does the artists table contain?
# 2. How many rows does each table contain (generic method)?
# 3. Return the list of all the artists and sort them by name (alphabetically). Hint: use the ORDER BY SQL filter.
# 4. Find all the love songs (i.e the tracks that contain “love” anywhere in their name). Hint: use the WHERE and LIKE SQL keywords.
# 5. Return all the tracks that are longer than a given duration and sort them. Hint: you can use the comparison operator > in SQL.

# query1 = <<~SQL
#   SELECT *
#   FROM artists
#   WHERE name LIKE "%Z%"
#   ORDER BY name
#   LIMIT 3
# SQL