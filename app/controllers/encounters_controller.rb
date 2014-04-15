class EncountersController < ApplicationController
  before_action :authenticate_user!

  def new
    @encounter = Encounter.new
  end

  def index
    @encounters = Encounter.all
  end

  def create
    @encounter = Encounter.new(encounter_params)
    if @encounter.save
      redirect_to encounters_url, notice: 'Encounter added to schedule'
    else
      render 'new'
    end
  end

  def show
    @encounter = Encounter.find(params[:id])
  end

  protected
  def encounter_params
    params.require(:encounter).permit(:patient_name, :insurance_provider, :notes, :procedure_id, :user_id)
  end
end
