module AuthSpecHelper
  def sign_in_admin
    session[:auth] = {
        authorized: true,
        expire_at: 1.week.from_now
    }
  end
end