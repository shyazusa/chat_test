FactoryBot.define do
  factory :user_room do
    user { build(:user) }
    romm { build(:room) }
  end
end
