class AdminAuthenticator

  NUM_FAILED_ATTEMPTS = 10

  attr_reader :session, :auth_params, :error_message

  def initialize(session, auth_params = nil)
    @session = session
    @auth_params = auth_params
  end

  def authenticated?
    auth = session[:auth]
    auth.present? && auth[:authorized] && auth[:expire_at] >= Time.now
  end

  def sign_in
    return false if admin_locked?
    if username_and_password_valid?
      session[:auth] = { authorized: true, expire_at: 2.weeks.from_now }
      log_sign_in
      true
    else
      @error_message = "Username or password is incorrect."
      log_failed_attempt
      false
    end
  end

  def sign_out
    session.delete(:auth)
  end

  private

  def log_failed_attempt
    AdminSettings.first_or_initialize.increment!(:failed_attempts)
  end

  def log_sign_in
    settings = AdminSettings.first_or_initialize
    settings.last_sign_in = Time.now
    settings.save
  end

  def username_and_password_valid?
    (auth_params[:username] == ENV['USERNAME']) &&
        (auth_params[:password] == ENV['PASSWORD'])
  end

  def admin_locked?
    failed_attempts = AdminSettings.first_or_initialize.failed_attempts.to_i
    if failed_attempts >= NUM_FAILED_ATTEMPTS
      @error_message = "Unable to sign in.  This account is locked."
      return true
    end
    false
  end

end