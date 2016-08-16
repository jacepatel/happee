class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def slack
    # We have received a response from the omniauth callback - commence user and team creation
    response = request.env["omniauth.auth"]
    @user = User.from_omniauth(response)
    binding.pry
    team = Team.create_or_update_from_slack(response)
    user.teams << team
    binding.pry
    # Now we manage the user and direction
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Slack") if is_navigational_format?
    else
      session["devise.slack_data"] = response
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
