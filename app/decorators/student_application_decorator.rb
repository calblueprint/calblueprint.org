class StudentApplicationDecorator < ApplicationDecorator
  delegate_all

  def display_attributes
    [[:wins_count, "Number of Wins"],
     [:losses_count, "Number of Losses"],
     :year,
     [:applied_before, "Applied before?"],
     :why_join,
     :experience,
     :projects,
     :service,
     [:available_for_bp_games, "Available for BP Games?"],
     [:why_no_bp_games, "Why unavailable for BP Games?"],
     [:available_for_retreat, "Available for Retreat?"],
     [:why_no_retreat, "Why unavailable for Retreat?"],
     :phone,
     :email,
     :resume,
     :design_portfolio]
  end

  def comparison_attributes
    [:year,
     [:available_for_bp_games, "Available for BP Games?"],
     [:why_no_bp_games, "Why unavailable for BP Games?"],
     [:available_for_retreat, "Available for Retreat?"],
     [:why_no_retreat, "Why unavailable for Retreat?"],
     [:applied_before, "Applied before?"],
     :why_join,
     :experience,
     :projects,
     :service]
  end

  def resume
    h.link_to "View Resume", object.resume.url, target: '_blank',
    class: 'bp-btn btn-light btn-sm'
  end

  def design_portfolio
    h.link_to "View Design Portfolio", object.design_portfolio.url, target: '_blank',
    class: 'bp-btn btn-light btn-sm'
  end

  def attribute_title_html(attribute)
    h.content_tag :h2, class: "comparison-section-title" do
      if attribute.is_a?(Array)
        attribute[1]
      else
        object.class.human_attribute_name(attribute)
      end
    end
  end

  def comparison_attribute_html(attribute)
    h.content_tag :div, class: "comparison-section-item" do
      val = send(attribute.is_a?(Array) ? attribute[0] : attribute)
      !!val == val && val = yesno(val)
      h.simple_format val
    end
  end
end
