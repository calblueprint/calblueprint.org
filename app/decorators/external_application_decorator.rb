class ExternalApplicationDecorator < ApplicationDecorator
  delegate_all

  def display_attributes
    [:year,
     :major,
     [:operations, "Applied for Operations Director"],
     [:outreach, "Applied for Outreach Director"],
     [:content, "Applied for Content Director"],
     :additional_option,
     [:applied_before, "Applied before?"],
     :social_links,
     :personal_growth,
     [:why_join, ::I18n.t("simple_form.labels.student_application.why_join")],
     :commitments,
     :design_experience,
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
