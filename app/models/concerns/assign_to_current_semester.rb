module AssignToCurrentSemester
  extend ActiveSupport::Concern

  included do
    before_validation :assign_to_current_semester, on: :create
  end

  def assign_to_current_semester
    self.semester = Semester.current_semester unless semester.present?
  end
end
