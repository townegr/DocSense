class EncountersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def new
    @encounter = Encounter.new
  end

  def index
    # if there are the start_date and end_date params
      # report = Report.new(pass in the params)
      # @encounters = report.encounters
    # else
      @grouped_encounters = current_user.encounters.group_by_day(:created_at).count
      if params[:date]
        date = Date.parse(params[:date])
        @encounters = current_user.encounters.where(created_at: date.beginning_of_day..date.end_of_day)
      else
        @encounters = current_user.encounters
      end
    # end
  end

  def create
    @encounter = Encounter.new(encounter_params)
    # @encounter.includes([:user, :procedure]).where(user: current_user)
    @encounter.user_id = current_user.id
    @encounter.set_physician_fee

    respond_to do |format|
      if @encounter.save
        format.html { redirect_to @encounter, notice: 'Encounter was successfully created' }
        format.json { render action: 'show', status: :created, location: @encounter }
        #redirect_to encounters_url, notice: 'Encounter added to schedule'
      else
        format.html { render action: 'new' }
        format.json { render json: @encounter.errors, status: :unprocessable_entity }
        #render 'new'
      end
    end
  end

  def show
    @encounter = Encounter.find(params[:date])
  end

  private

  def set_event
    @encounter = Encounter.find(params[:date])
  end

  def encounter_params
    params.require(:encounter).permit(:patient_name, :insurance_provider, :notes, :procedure_id).merge(user: current_user)
  end
end
