class Admin::MembersController < Admin::BaseController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find params[:id]
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new member_params
    if @member.save
      redirect_to admin_members_path
    else
      render 'new'
    end
  end

  def edit
    @member = Member.find params[:id]
  end

  def update
    @member = Member.find params[:id]
    if @member.update_attributes member_params
      redirect_to admin_members_path
    else
      render 'edit'
    end
  end

  def destroy
    Member.destroy params[:id]
    redirect_to admin_members_path, flash: { success: "Member deleted!" }
  end

  private

  def member_params
    params.require(:member).permit(:last_name, :first_name, :email, :member_role_id, :is_alumnus)
  end
end
