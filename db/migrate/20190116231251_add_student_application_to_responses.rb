class AddStudentApplicationToResponses < ActiveRecord::Migration[5.2]
  def change
    add_reference :responses, :student_application, foreign_key: true
  end
end
