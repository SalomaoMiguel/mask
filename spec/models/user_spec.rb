require 'rails_helper'

RSpec.describe User, type: :model do
  it "User is valid" do
    user = User.new(
      email: "user@example.com",
      password: "123456",
      name:"user_first",
      phone: "629897979",
      avatar: fixture_file_upload(Rails.root.join("spec", "support", "test-avatar.png"), "image/png")
    )
    expect(user).to be_valid
  end

  it "User is not valid" do 
    user = Admin.new(email: "user@example.com", password: "")

    expect(user).to_not be_valid
  end
end
