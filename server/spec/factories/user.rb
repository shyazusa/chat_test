FactoryBot.define do
  factory :user do
    name { '四条 貴音' }
    email { 'takane@example.com' }
    password do
      Digest::SHA256.hexdigest('takane@example.com')
    end
  end
end
