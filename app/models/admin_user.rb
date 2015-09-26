class AdminUser < ActiveRecord::Base

  before_save :create_admin
  validates :password, presence: true

  def correct_password?(input_password)
    self.password == Digest::MD5.hexdigest(input_password).to_s
  end

  def create_admin
    hashed_password = Digest::MD5.hexdigest(self.password).to_s
    self.password = hashed_password
  end

end
