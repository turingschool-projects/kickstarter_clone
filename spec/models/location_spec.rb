require 'rails_helper'

RSpec.describe Location, type: :model do
  context "associations" do
    it { should have_many(:projects) }
  end
end
