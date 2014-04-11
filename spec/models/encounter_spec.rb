require 'spec_helper'

describe Encounter do
  it { should belong_to(:patient) }
  it { should belong_to(:user) }
  it { should belong_to(:procedure) }
  it { should validate_presence_of(:patient) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:procedure) }
end
