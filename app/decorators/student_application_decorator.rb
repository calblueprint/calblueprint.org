class StudentApplicationDecorator < ApplicationDecorator
  delegate_all

  def display_attributes
    [:year,
     :why_join,
     :resume,
     [:available_for_bp_games, "Available for BP Games?"],
     [:available_for_retreat, "Available for Retreat?"],
     :phone,
     :email]
  end

  def resume
    h.link_to "Link", object.resume.url, target: '_blank'
  end
end
