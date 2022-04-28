require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it "User can follow another user" do
    bob = FactoryBot.create(:user, email: "bob@example.com")
    matt = FactoryBot.create(:user, email: "matt@example.com")

    Subscription.create(followed: bob, followed_by: matt)

    expect(bob.followers.count).to eq 1
    expect(bob.followers).to include matt
    
    expect(matt.following.count).to eq 1
    expect(matt.following).to include bob

    expect(bob.following.count).to eq 0
    expect(bob.following).to_not include matt

    expect(matt.followers.count).to eq 0
    expect(matt.followers).to_not include bob

    donaldo = FactoryBot.create(:user, email: "donaldo@example.com")

    Subscription.create(followed: bob, followed_by: donaldo)

    expect(bob.followers.count).to eq 2
    expect(bob.followers).to include donaldo
    
    expect(donaldo.following.count).to eq 1
    expect(donaldo.following).to include bob

  end
end
