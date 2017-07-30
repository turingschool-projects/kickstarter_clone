require 'rails_helper'

RSpec.describe Location, type: :model do
  context "associations" do
    it { should have_many(:projects) }
  end

  context "validations" do
    it { should validate_presence_of(:postal_code) }
  end
end
