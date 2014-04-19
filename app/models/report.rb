class Report
  include ActiveModel::Model

  attr_reader :start_date, :end_date

  def initialize(start_date = nil, end_date = nil)
    @start_date = start_date
    @end_date = end_date
  end

  def encounters
    @encounters = Encounter.where(created_at: start_date..end_date)
    # boundary case => test for this
    # @encounters = Encounter.where(created_at: start_date <=> end_date)
    # @encounters = Encounter.where(user: current_user).where(created_at: start_date..end_date)
  end
end
