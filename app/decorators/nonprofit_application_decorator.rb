class NonprofitApplicationDecorator < ApplicationDecorator
  delegate_all

  def display_attributes
    [:email, :purpose, :history, :date_established, :legal,
     :short_summary, :goals, :key_features, :devices, :target_audience, :why]
  end

  def attribute_html(attribute)
    h.content_tag :div, class: "two-col-container" do
      left_col_html(attribute) + right_col_html(attribute)
    end
  end

  def date_established
    object.date_established.readable_inspect
  end

  def legal
    yes_no object.legal
  end

  def devices
    object.devices.reject(&:empty?).join(", ")
  end

  private

  def left_col_html(attribute)
    h.content_tag :div, class: "two-col-left" do
      h.content_tag :h4 do
        object.class.human_attribute_name(attribute)
      end
    end
  end

  def right_col_html(attribute)
    h.content_tag :div, class: "two-col-right" do
      h.simple_format send(attribute)
    end
  end
end
