require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_user) {build(:user)}

  describe 'validation' do
    it 'valid_user is valid' do
      expect(valid_user.valid?).to eq true
    end
  end

  describe 'self.register' do
    it 'return true when nothing wrong' do
      password = 'haruka-123'
      r = User.register(
        '天海 春香',
        'haruka@example.com',
        password
      )
      expect(r.success?).to eq true
      user = r.data
      expect(user.id).not_to eq nil
    end

    it 'password is hashed' do
      password = 'haruka-123'
      hashed_pass = Digest::SHA256.hexdigest(password)
      r = User.register(
        '天海 春香',
        'haruka@example.com',
        password
      )
      user = r.data
      expect(user.password).not_to eq password
      expect(user.password).to eq hashed_pass
    end

    it 'password checking works correctly' do
      invalid_password = [
        nil,
        'test',
        '123',
        'a2-45678',
        'a-a-a-abc',
        'abcd56789'
      ]
      invalid_password.each do |password|
        r = User.register(
          '天海 春香',
          'haruka@example.com',
          password
        )
        expect(r.success?).to eq false
      end
    end

    it 'return false when user invalid' do
      not_mail_add = 'test example.com'
      r = User.register(
        '四条 貴音',
        not_mail_add,
        'abc-567890'
      )
      expect(r.success?).to eq false
    end
  end
end
