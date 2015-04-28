module AssignToCurrentSemester
  extend ActiveSupport::Concern

  included do
    before_validation :assign_to_current_semester, on: :create, unless: :semester_id
  end

  def assign_to_current_semester
    self.semester = Semester.find(Settings.instance.current_semester_id)
  end
end
