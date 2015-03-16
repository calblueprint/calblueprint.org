module Admins
  class SemestersController < BaseController
    def index
      @semesters = Semester.all
    end
  end
end
