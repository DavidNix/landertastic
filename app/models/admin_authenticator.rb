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

end