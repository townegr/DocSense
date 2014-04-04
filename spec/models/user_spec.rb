require 'spec_helper'

describe User do
  it { should_not have_valid(:first_name).when(nil, '') }
  it { should_not have_valid(:last_name).when(nil, '') }
  it { should have_valid(:email).when('test@test.com') }
end
