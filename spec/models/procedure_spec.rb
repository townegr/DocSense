require 'spec_helper'

describe Procedure do
  it { should validate_numericality_of(:code) }
  it { should have_valid(:description).when('procedure description') }
  it { should_not have_valid(:work_rvu).when(nil, '', 14, '14') }
  it { should have_many(:users) }
  it { should have_many(:patients) }
end
