class Report
  include ActiveModel::Model

  attr_reader :start_date, :end_date

  def initialize(start_date = DateTime.now, end_date = DateTime.now)
    @start_date = start_date
    @end_date = end_date
  end

  def encounters
    @encounters = Encounter.where(created_at: DateTime.parse(start_date)..DateTime.parse(end_date))
  end
end
