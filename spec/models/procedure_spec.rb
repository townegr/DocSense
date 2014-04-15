require 'spec_helper'

describe Procedure do
  it { should have_many(:encounters) }
  it { should have_many(:users) }

  it { should validate_presence_of(:code) }
  it { should validate_presence_of(:description) }
  it { should have_valid(:description).when('procedure description') }
  it { should_not have_valid(:description).when(nil, '') }
  it { should validate_presence_of(:work_rvu) }
  it { should_not have_valid(:work_rvu).when(nil, '') }
end
