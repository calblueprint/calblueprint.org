class StudentApplicationDecorator < ApplicationDecorator
  delegate_all

  def display_attributes
    [:year,
     :why_join,
     [:resume_file_name, "Resume"],
     [:available_for_bp_games, "Available for BP Games?"],
     [:available_for_retreat, "Available for Retreat?"],
     :phone,
     :email]
  end

  def resume_file_name
    h.link_to "Link", object.resume_file_name
  end
end
