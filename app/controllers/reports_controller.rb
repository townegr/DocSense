class ReportsController < ApplicationController
  def new
    @report = Report.new
  end

  def create
    start_date = report_params[:start_date]
    end_date = report_params[:end_date]

    @report = Report.new(start_date, end_date)

    render :index
  end

  def search
    @report = Report.new(report_params)
    @encounters = @report.set_encounter_report
  end

  private
  def report_params
     params.require(:report).permit(:start_date, :end_date)
  end
end
