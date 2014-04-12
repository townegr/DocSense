require 'spec_helper'

describe Procedure do
  it { should have_many(:encounters) }
  it { should have_many(:users) }
  it { should have_many(:patients) }

  #write test for (:code).where('A1234', '12345') valid & invalid
  it { should validate_presence_of(:code) }
  it { should validate_presence_of(:description) }
  it { should have_valid(:description).when('procedure description') }
  it { should_not have_valid(:description).when(nil, '') }
  it { should validate_presence_of(:work_rvu) }
  it { should have_valid(:work_rvu).when(17.04, 119.99) }
  it { should_not have_valid(:work_rvu).when(nil, '', 14.000, '14') }
end
