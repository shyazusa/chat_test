FactoryBot.define do
  factory :room do
    content { "おはよう" }
    user { build(:user) }
    romm { build(:room) }
  end
end
