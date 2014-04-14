require 'spec_helper'

describe User do
  it { should have_many(:encounters) }
  it { should have_many(:procedures) }

  it { should validate_presence_of(:first_name) }
  it { should_not have_valid(:first_name).when(nil, '') }
  it { should validate_presence_of(:last_name) }
  it { should_not have_valid(:last_name).when(nil, '') }
  it { should validate_numericality_of(:dollar_per_rvu).only_integer }
  it { should have_valid(:email).when('test@test.com') }
  it { should have_valid(:job_title).when('Medical Provider', 'Administrative Staff') }
  it { should_not have_valid(:dollar_per_rvu).when(nil, '') }
end
