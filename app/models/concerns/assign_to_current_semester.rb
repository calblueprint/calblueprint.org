module AssignToCurrentSemester
  extend ActiveSupport::Concern

  included do
    before_create :assign_to_current_semester
  end

  def assign_to_current_semester
    # TODO: Settings are not initilized yet here
    # self.semester = Semester.find(Settings.new.current_semester_id)
  end
end
