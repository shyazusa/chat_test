FactoryBot.define do
  factory :msg do
    content { "おはよう" }
    user { build(:user) }
    room { build(:room) }
  end
end
