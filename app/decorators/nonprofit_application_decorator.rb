class NonprofitApplicationDecorator < ApplicationDecorator
  delegate_all

  def display_attributes
    [:email, :cs169_pool, :purpose, :history, :date_established, :legal, :org_description,
     :short_summary,:current_resources, :key_features, :goals, :future_plans, :inclusivity, :devices, :target_audience, :why,
     :technical_requirements, :client_status]
  end

end
