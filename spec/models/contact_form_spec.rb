# == Schema Information
#
# Table name: contact_forms
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name       :string
#  email      :string
#  subject    :string
#  message    :text
#

require 'rails_helper'

RSpec.describe ContactForm, type: :model do
  it { should validate_presence_of :name }

  it { should validate_presence_of :email }
  it { should allow_value('sam@sam.com').for :email }
  it { should_not allow_value('sam.com').for :email }

  it { should validate_presence_of :subject }
  it { should validate_length_of(:subject).is_at_most(80) }

  it { should validate_presence_of :message }
end
