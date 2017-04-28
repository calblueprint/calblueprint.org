class ExternalApplicationDecorator < ApplicationDecorator
  delegate_all

  def display_attributes
    [:year,
     :major,
     [:operations, "Applied for Operations Director"],
     [:content, "Applied for Content Director"],
     [:design, "Applied for Design Director"],
     [:applied_before, "Applied before?"],
     :website,
     :why_join,
     :experience,
     :design_experience,
     [:available_for_bp_games, "Available for BP Games?"],
     [:why_no_bp_games, "Why unavailable for BP Games?"],
     [:available_for_retreat, "Available for Retreat?"],
     [:why_no_retreat, "Why unavailable for Retreat?"],
     :phone,
     :email,
     :resume]
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

end
