FactoryBot.define do
  factory :room do
    user { build(:user) }
    romm { build(:room) }
    msg { build(:msg, user: user, room: room) }
  end
end
