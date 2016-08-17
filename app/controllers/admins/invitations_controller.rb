module Admins
  class InvitationsController < Devise::InvitationsController
    before_action :authenticate_admin!
  end
end
