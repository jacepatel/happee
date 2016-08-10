class CreateChannels < ActiveRecord::Migration[5.0]
  def change
    create_table :channels do |t|
      ## Database authenticatable
      t.string :name,              null: false
      t.integer :team_id,          null: false
      t.string :uid, null: false
      t.timestamps null: false
    end
    add_foreign_key :channels, :teams
  end
end
