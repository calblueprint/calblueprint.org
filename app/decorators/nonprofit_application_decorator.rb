class NonprofitApplicationDecorator < ApplicationDecorator
  delegate_all

  def display_attributes
    [:email, :cs169_pool, :purpose, :history, :date_established, :legal,
     :short_summary, :goals, :key_features, :devices, :target_audience, :why,
     :technical_requirements, :client_status, :current_resources, :future_plans]
  end

  def date_established
    object.date_established.readable_inspect
  end

  def devices
    object.devices.reject(&:empty?).join(", ")
  end
end
