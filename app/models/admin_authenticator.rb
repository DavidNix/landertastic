class AdminAuthenticator

  attr_reader :session, :auth_params

  def initialize(session, auth_params = nil)
    @session = session
    @auth_params = auth_params
  end

  def authenticated?
    auth = session[:auth]
    auth.present? && auth[:authorized] && auth[:expire_at] >= Time.now
  end

  def sign_in
    if username_and_password_match?
      session[:auth] = { authorized: true, expire_at: 2.weeks.from_now }
      return true
    end
    false
  end

  def sign_out
    session.delete(:auth)
  end

  private

  def username_and_password_match?
    (auth_params[:username] == ENV['USERNAME']) &&
        (auth_params[:password] == ENV['PASSWORD'])
  end

end