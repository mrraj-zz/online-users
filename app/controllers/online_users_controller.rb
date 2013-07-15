class OnlineUsersController < ApplicationController

  def index
    @online_users = User.joins(:sessions).uniq
  end
end
