# Methods that are used across specs
def sign_in(user)
  visit new_admin_session_path
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
