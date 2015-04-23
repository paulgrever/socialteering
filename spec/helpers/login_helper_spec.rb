def facebook_login
  OmniAuth.config.test_mode = true
  OmniAuth.config.logger = Rails.logger
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
    provider: "Facebook",
    uid: "123545",
    info: {
      full_name: "test user",
      first_name: "test_name",
      last_name: "user",
      email: "test@example.com",
      location: "Denver",
      image: "user_thumbnail_url", 
      login: "t",
      urls: { "Facebook" => "www.facebook.com"}
    },
    credentials: {
      token: "mock_token",
      secret: "mock_secret"
    },
    extra: { raw_info: { gender: "male"}}
    )
end