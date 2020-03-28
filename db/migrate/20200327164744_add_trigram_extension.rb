class AddTrigramExtension < ActiveRecord::Migration[5.2]
  def change
  def up
    execute "create extension pg_trgm"
  end
end
  def down
    execute "drop extension pg_trgm"
  end
end
