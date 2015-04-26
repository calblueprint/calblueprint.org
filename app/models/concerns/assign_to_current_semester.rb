module AssignToCurrentSemester
  extend ActiveSupport::Concern

  included do
    before_create :assign_to_current_semester, unless: :semester_id
  end

  def assign_to_current_semester
    self.semester = Semester.find(Settings.instance.current_semester_id)
  end
end
