ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

class CreateAllTables < ActiveRecord::Migration[5.0]
  def self.up
    create_table(:posts) do |t|
      t.timestamps
    end
  end
end

ActiveRecord::Migration.verbose = false
CreateAllTables.up
