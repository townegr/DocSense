class Report
  include ActiveModel::Model

  attr_reader :start_date, :end_date

  def initialize(start_date = nil, end_date = nil)
    @start_date = start_date
    @end_date = end_date
  end

  def encounters
    @encounters = Encounter.where(created_at: DateTime(start_date).beginning_of_day..DateTime(end_date).end_of_day)
  end
end
