class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    User.find_or_create_from_auth(auth)
  end
end
