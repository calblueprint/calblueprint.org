class StudentApplicationDecorator < ApplicationDecorator
  delegate_all

  def display_attributes
    [:year,
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
     :resume]
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
    h.link_to "Link", object.resume.url, target: '_blank'
  end

  def attribute_title_html(attribute)
    h.content_tag :div, class: "small-4 columns align-left" do
      h.content_tag :h4 do
        if attribute.is_a?(Array)
          attribute[1]
        else
          object.class.human_attribute_name(attribute)
        end
      end
    end
  end

  def comparison_attribute_html(attribute)
    h.content_tag :div, class: "small-4 columns align-left" do
      val = send(attribute.is_a?(Array) ? attribute[0] : attribute)
      !!val == val && val = yesno(val)
      h.simple_format val
    end
  end
end
