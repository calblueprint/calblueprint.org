class AddMeetTheClubQuestionToExternalApplication < ActiveRecord::Migration[5.2]
  def change
    add_column :external_applications, :available_for_meet_the_club, :string
    add_column :external_applications, :why_no_meet_the_club, :text
  end
end
