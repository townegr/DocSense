class Report
  include ActiveModel::Model

  attr_reader :start_date, :end_date

  def initialize(user, start_date = nil, end_date = nil)
    @user = user
    @start_date = start_date ? Date.parse(start_date) : nil
    @end_date = start_date ? Date.parse(end_date) : nil
  end

  def encounters
    @encounters = Encounter.where(created_at: start_date.beginning_of_day..end_date.end_of_day, user: @user)
  end
end
