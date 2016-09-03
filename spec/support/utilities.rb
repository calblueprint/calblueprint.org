# Methods that are used across specs

# Signs in an admin or a NPO
def sign_in(user)
  visit Rails.application.routes.url_helpers.send("new_#{user.class.name.underscore}_session_path")
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Log in"
end

def auth_from_identity(identity)
  create :auth, uid: identity.uid, provider: identity.provider
end
#
# Set options to login with google or fb
def create_omniauth(opts = {})
  auth = create :auth
  real_auth = auth.merge(opts)
  provider = real_auth[:provider]
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[provider] = auth
end

# Because FFaker has an absurd 249 word limit
def words(n)
  final = []
  while n > 0
    if n < 249
      final += FFaker::Lorem.words(n)
      n = 0
    else
      final += FFaker::Lorem.words(249)
      n -= 249
    end
  end
  final.join(" ")
end

# Good for testing multiple sessions simultaneously
# http://blog.bruzilla.com/2012/04/10/using-multiple-capybara-sessions-in-rspec-request.html
def in_browser(name)
  old_session = Capybara.session_name

  Capybara.session_name = name
  yield

  Capybara.session_name = old_session
end
