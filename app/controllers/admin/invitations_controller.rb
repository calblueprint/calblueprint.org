class Admin::InvitationsController < Devise::InvitationsController
  before_action :authorize_admin!
end
