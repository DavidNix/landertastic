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
      log_and_reset_admin_settings
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

  def admin_record
    @admin_record ||= AdminSettings.first_or_initialize
  end

  def log_and_reset_admin_settings
    admin_record.failed_attempts = 0
    admin_record.last_sign_in = Time.now
    admin_record.save
  end

  def log_failed_attempt
    admin_record.increment!(:failed_attempts)
  end

  def username_and_password_valid?
    (auth_params[:username] == ENV['USERNAME']) &&
        (auth_params[:password] == ENV['PASSWORD'])
  end

  def admin_locked?
    failed_attempts = admin_record.failed_attempts.to_i
    (failed_attempts >= NUM_FAILED_ATTEMPTS).tap do |locked|
      @error_message = "Unable to sign in.  This account is locked." if locked
    end
  end
end