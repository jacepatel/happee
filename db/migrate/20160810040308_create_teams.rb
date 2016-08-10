class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      ## Database authenticatable
      t.string :name,              null: false, default: ""
      t.string :uid, null: false, default: ""
      t.timestamps null: false
    end
    add_index :teams, :uid,                unique: true
  end
end
