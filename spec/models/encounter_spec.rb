require 'spec_helper'

describe Encounter do
  it { should belong_to(:user) }
  it { should belong_to(:procedure) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:procedure) }

  describe "#set_physician_fee" do
    it "sets the correct physician fee" do
      user = User.new(dollar_per_rvu: 10)
      procedure = Procedure.new(work_rvu: 15.0)
      encounter = Encounter.new(user: user, procedure: procedure)

      encounter.set_physician_fee

      expect(encounter.physician_fee).to eq 150
    end
  end
end
