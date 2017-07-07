class ApplicationDecorator < Draper::Decorator
  def yesno(pred)
    pred ? "Yes" : "No"
  end

  def html(attribute)
    h.content_tag :div, class: "app-item-row" do

    end
  end

  def attribute_html(attribute)
    h.content_tag :div, class: "app-row" do
      left_col_html(attribute) + right_col_html(attribute)
    end
  end

  def left_col_html(attribute)
    h.content_tag :h3, class: "heading" do
      if attribute.is_a?(Array)
        attribute[1]
      else
        object.class.human_attribute_name(attribute)
      end
    end
  end

  def right_col_html(attribute)
    val = send(attribute.is_a?(Array) ? attribute[0] : attribute)
    if !!val == val
      val = yesno(val)
    elsif val.is_a? Numeric
      val = val.to_s
    end
    h.simple_format val
  end
end
