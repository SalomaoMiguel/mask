FactoryBot.define do
  factory :user do
    name { "User_First" }
    email { "user@email.com" }
    phone { "99646499" }
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/test-avatar.png'), 'image/png') }
    password { "123468" }
  end
end