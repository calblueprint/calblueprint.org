class Admin::SemestersController < Admin::BaseController
  def index
    @semesters = Semester.all
  end

  def show
    @semester = Semester.find params[:id]
  end

  def new
    @semester = Semester.new
  end

  def create
    @semester = Semester.new member_params
    if @semester.save
      redirect_to admin_semesters_path
    else
      render 'new'
    end
  end

  def edit
    @semester = Semester.find params[:id]
  end

  def update
    @semester = Semester.find params[:id]
    if @semester.update_attributes member_params
      redirect_to admin_semesters_path
    else
      render 'edit'
    end
  end

  # Destroy is only allowed if the semester has no student applications or projects
  # Otherwise, admin should reassign student applications and projects and then delete
  def destroy
    @semester = Semester.find params[:id]
    if @semester.can_be_destroyed?
      @semester.destroy
      flash[:success] = t("admin.semesters.destroy.success")
    else
      flash[:error] = t("admin.semesters.destroy.error")
    end
    redirect_to admin_semesters_path
  end

  private

  def member_params
    params.require(:semester).permit(:season, :year)
  end
end
