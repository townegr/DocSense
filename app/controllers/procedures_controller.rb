class ProceduresController < ApplicationController
  before_action :authenticate_user!

  def new
    @procedure = Procedure.new
  end

  def index
    @procedures = Procedure.all
  end

  def create
    @procedure = Procedure.new(procedure_params)
    if @procedure.save
      redirect_to procedures_url, notice: 'Procedure added to schedule'
    else
      render 'new'
    end
  end

  def show
    @procedure = Procedure.find(params[:id])
  end

  protected
  def procedure_params
    params.require(:procedure).permit(:patient_name, :description, :code, :work_rvu, :insurance_provider)
  end
end
