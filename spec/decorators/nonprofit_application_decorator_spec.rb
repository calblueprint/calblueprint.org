require 'rails_helper'

describe NonprofitApplicationDecorator do
  let(:nonprofit_application) { create :finished_nonprofit_application, legal: true }

  subject(:decorator) { NonprofitApplicationDecorator.new nonprofit_application }

  describe "#date_established" do
    it "returns a readable date" do
      expect(decorator.date_established).to eql(
        nonprofit_application.date_established.readable_inspect
      )
    end
  end

  describe "#devices" do
    it "removes blank elements and returns an comma'd string" do
      expect(decorator.devices).to eql(
        nonprofit_application.devices.reject(&:empty?).join(", ")
      )
    end
  end
end
