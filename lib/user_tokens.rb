module UserTokens
  require 'securerandom'

  def set_access_token
    self.access_token = SecureRandom.base64(69)
    cookies.signed[:access_token] = self.access_token
  end

  def check_access_token?
    unless self.access_token == cookies.signed[:access_token]
      return false
    end
  end
end
