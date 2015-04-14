module Admins
  class MemberRolesController < BaseController
    def index
      @member_roles = MemberRole.all
    end

    def new
      @member_role = MemberRole.new
    end

    def create
      @member_role = MemberRole.new member_role_params
      if @member_role.save
        redirect_to admin_member_roles_path
      else
        render 'new'
      end
    end

    def destroy
      @member_role = MemberRole.find params[:id]
      if @member_role.can_be_destroyed?
        @member_role.destroy
      else
        # TODO: display 'cannot delete' error
      end
      redirect_to admin_member_roles_path
    end

    private

    def member_role_params
      params.require(:member_role).permit(:role)
    end
  end
end
