require "rails_helper"

RSpec.describe User, type: :model do
  let(:valid_user) {build(:user)}

  describe "validation" do

    it "valid_user is valid" do
      expect(valid_user.valid?).to eq true
    end
  end
end
