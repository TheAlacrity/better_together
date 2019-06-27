class Api::MatchesController < ApplicationController
  before_action :authenticate_user

  def index
    @users = current_user.confirmed_matches
    render 'index.json.jbuilder'
  end
end
