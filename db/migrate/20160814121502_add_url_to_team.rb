class AddUrlToTeam < ActiveRecord::Migration[5.0]
  def change
      add_column :teams, :url, :string
  end
end
