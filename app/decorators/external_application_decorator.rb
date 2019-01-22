class ExternalApplicationDecorator < ApplicationDecorator
  delegate_all

  def display_attributes
    [:year,
     :major,
     [:applied_before, "Applied before?"],
     :social_links,
     [:why_join, ::I18n.t("simple_form.labels.external_application.why_join")],
     :commitments,
     :phone,
     :email,
     :resume,
     :design_portfolio,
     :design_portfolio_link]
  end

  def resume
    h.link_to "Link", object.resume.url, target: '_blank'
  end

  def design_portfolio
    if object.design_portfolio_file_size
      h.link_to 'View Design Portfolio', object.design_portfolio.url, target: '_blank',
      class: 'bp-btn btn-light btn-sm'
    else
      'No Attachment'
    end
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
