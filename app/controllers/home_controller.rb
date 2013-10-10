class HomeController < ApplicationController

  def index
    record_hit unless AdminAuthenticator.new(session).authenticated?
  end

  private

  def record_hit
    Hit.create(
        ip_address: request.env['REMOTE_ADDR'],
        user_agent: request.env['HTTP_USER_AGENT']
    )
  end
end