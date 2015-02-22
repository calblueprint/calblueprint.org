# Methods that are used across specs

def sign_in(user)
  visit new_admin_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Log in"
end

def auth(identity)
  auth = double("identity")
  allow(auth).to receive_messages uid: identity.uid, provider: identity.provider
  auth
end
