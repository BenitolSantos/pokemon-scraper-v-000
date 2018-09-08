require 'bundler/setup'

Bundler.require

require 'pry'

require_relative "../lib/pokemon"
require_relative "../lib/scraper"
require_relative "sql_runner"

@db = SQLite3::Database.new('../pokemon.db')
#connects ruby to our database.
@db.execute("DROP TABLE IF EXISTS pokemon;")
#creates pokemon table.
@sql_runner = SQLRunner.new(@db)
@sql_runner.execute_schema_migration_sql
