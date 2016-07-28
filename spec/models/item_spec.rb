require 'rails_helper'

RSpec.describe Item, type: :model do
  context "validations" do
    it { should validate_uniqueness_of(:name) }
  end
end
