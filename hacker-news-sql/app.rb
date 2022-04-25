require "sqlite3"

# Instantiate a constant variable, DB, usable in all your files
dir = File.dirname(__FILE__)
DB = SQLite3::Database.new(File.join(dir, "db/posts.db"))
DB.results_as_hash = true
# Require all the ruby files you have created in `app`
Dir[File.join(dir, "app/**/*.rb")].sort.each { |file| require file }

# Launch the app!
Router.new.run
