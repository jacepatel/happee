# Ensure logins for all controllers
class SecureController < ApplicationController
  include Pundit
  before_filter :authenticate_user!
end
