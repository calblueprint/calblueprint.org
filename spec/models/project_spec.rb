# == Schema Information
#
# Table name: projects
#
#  id               :integer          not null, primary key
#  title            :string
#  short_summary    :string
#  link             :string
#  created_at       :datetime
#  updated_at       :datetime
#  full_description :text
#

require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :short_summary }
  it { should validate_presence_of :link }
  it { should validate_presence_of :full_description }
end
