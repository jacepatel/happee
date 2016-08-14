class Team < ApplicationRecord
  belongs_to :users

  def create_or_update_from_slack(response)
    team_info = response[:extra][:team_info][:team]
    slack_team = {
      name: team_info[:name],
      uid: team_info[:id],
      url: team_info[:domain],
      image: team_info[:icon][:image_230]
    }
    binding.pry
    self.create_or_update(slack_team)
  end

end
