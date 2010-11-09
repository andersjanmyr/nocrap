class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.integer :user_id
      t.string :oauth_token
      t.string :oauth_secret

      t.timestamps
    end
  end

  def self.down
    drop_table :sessions
  end
end
