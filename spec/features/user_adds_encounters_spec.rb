require 'spec_helper'

feature 'physician can extract procedure description, code, and work RVU from file', %Q{
  As an authenticated physician/user
  I want to submit procedure description
  So that I can populate my schedule with relevant procedure code and work RVU
  } do

  # ACCEPTANCE CRITERIA
  # I can submit procedure description in query
  # I can see closest matches to query and select exact CMS.gov descriptions
  # I can populate my relevant code and work RVU fields after selecting procedure description
  # I can persist submissions to the database

  scenario 'user adds a description for a patient encounter' do

  end
end
