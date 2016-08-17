module Admins
  class AdminsController < BaseController
    load_and_authorize_resource

    def destroy
      admin = Admin.find(params[:id])
      if admin.delete
        flash[:success] = t "admins.admins.destroy.success",
                            email: admin.email
      else
        flash[:error] = t("admins.admins.destroy.error")
      end
      redirect_to admin_admins_path
    end

    def promote
      admin = Admin.find(params[:admin_id])
      if admin.promote
        flash[:success] = t "admins.admins.promote.success",
                            role: admin.role
      else
        flash[:error] = t "admins.admins.promote.error",
                            role: admin.role
      end
      redirect_to admin_admins_path
    end

    def demote
      admin = Admin.find(params[:admin_id])
      if admin.demote
        flash[:success] = t "admins.admins.demote.success",
                            role: admin.role
      else
        flash[:error] = t "admins.admins.demote.error",
                            role: admin.role
      end
      redirect_to admin_admins_path
    end
  end
end
