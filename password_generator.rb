class PasswordGenerator
  require 'securerandom'

  def initialize(params = {})
    @length = params[:length]
    @has_upcase_word = params[:has_upcase_word] || true
    @has_number = params[:has_number] || true
    @password = nil
  end

  def run
    @password ||= define_password
    until password_check do
      @password = define_password
    end
    @password
  end

  private

  def define_password
    pwd = SecureRandom.base64.gsub(/\+|\-|\=|\\|\//, "")
    pwd[0..(@length - 1)]
  end

  def password_check
    return false unless has_upcase_check
    return false unless has_number_check
    has_downcase_check
  end

  def has_upcase_check
    return true unless @has_upcase_check
    @password.match(/[A-Z]/)
  end

  def has_downcase_check
    @password.match(/[a-z]/)
  end

  def has_number_check
    return true unless @has_number
    @password.match(/[\d]/)
  end
end
