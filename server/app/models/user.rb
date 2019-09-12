class User < ApplicationRecord
  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  PASSWORD_FORMAT = /\A[a-zA-Z0-9_-]{9,}\Z/

  has_many :rooms, through: :user_rooms
  has_many :msgs
  has_many :unread_msgs

  validates :name, presence: true

  validates :email,
    presence: true,
    format: EMAIL_FORMAT,
    uniqueness: true

  def self.register name, email, password
    errs = User.validate_password(password)
    if errs.length > 0
      return Result.new(errs, nil)
    end
    user = User.new(name: name, email: email, password: hash(password))
    if user.save
      return Result.new([], user)
    end
    Result.new user.errors.full_messages, user
  end

  def self.login email, password
    user = User.find_by(email: email, password: hash(password))
    if user.nil?
      return Result.new(['メールかパスワードが間違っています'])
    end
    session_id = SecureRandom.uuid
    r = SessionStorage.set session_id, user.id
    unless r.success?
      return Result.new(['セッション情報の保存に失敗しました'])
    end
    Result.new [], user
  end

  def self.logout
    r = SessionStorage.remove self.session_id
    unless r.success
      return Result.new(['セッション情報の削除に失敗しました'])
    end
    Result.new [], user
  end

  private

  def self.hash password
    Digest::SHA256.hexdigest password
  end

  def self.validate_password password
    errs = []
    if password.blank?
      errs << 'パスワードは必須です'
      return errs
    end

    has_char = !password.index(/[a-zA-z]/).nil?
    has_number = !password.index(/[0-9]/).nil?
    has_sym = !password.index(/[_-]/).nil?

    if !PASSWORD_FORMAT.match?(password) || !has_char || !has_number || !has_sym
      errs << 'パスワードは9文字以上で，英字，数字，記号(-_)をそれぞれ1つ以上含む必要があります'
    end
    return errs
  end
end
