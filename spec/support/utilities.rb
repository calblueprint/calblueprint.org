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

def fill_in_semester(season, year, is_current_semester=false)
  visit new_admin_semester_path
  select season, from: "Season:"
  fill_in "Year", with: year
  check "Current Semester" if is_current_semester
end
