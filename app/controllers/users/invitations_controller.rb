module Users
  class InvitationsController < Devise::InvitationsController
    before_action :authorize_admin!
  end
end
