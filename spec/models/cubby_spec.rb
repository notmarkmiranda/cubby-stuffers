require 'rails_helper'

RSpec.describe Cubby, type: :model do
  let!(:cubby) { create(:cubby) }

  it "has a valid factory" do
    expect(cubby).to be_valid
  end

  context "responds to the correct attributes" do
    it { expect(cubby).to respond_to(:user) }
    it { expect(cubby).to respond_to(:location) }
    it { expect(cubby).to respond_to(:column) }
    it { expect(cubby).to respond_to(:row) }
  end

  context "validations" do
    it { expect(cubby).to validate_presence_of(:location) }
    it { expect(cubby).to validate_presence_of(:column) }
    it { expect(cubby).to validate_presence_of(:row) }
  end

  describe "instance can return a display location" do
    it { expect(cubby.display_location).to eq("Big Workspace A1") }
  end

  describe "class can return the cubbie locations" do
    it "returns available cubbie locations" do
      expect(Cubby.get_locations).to include "Big Workspace"
    end

    it "returns cubbie columns" do
      expect(Cubby.get_columns).to include "A"
    end
    
    it "returns available cubby rows" do
      expect(Cubby.get_rows).to include "1"
    end
  end

end
