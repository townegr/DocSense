require 'spec_helper'

describe Patient do
  it { should_not have_valid(:name).when(nil, '') }
  it { should have_many(:users) }
  it { should have_many(:procedures) }
end
