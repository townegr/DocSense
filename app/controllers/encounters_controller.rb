class EncountersController < ApplicationController
  before_action :authenticate_user!

  def new
    @encounter = Encounter.new

    #previous input disregarding n+1
    # @encounters = current_user.encounters

    #optimize with eager loading associations
    @encounters = current_user.encounters.includes(:user, :procedure)
  end

  def index
      #previous input disregarding n+1
      # @grouped_encounters = current_user.encounters.group_by_day(:created_at).count

      #querying via eager loading
      @grouped_encounters = current_user.encounters.includes(:user, :procedure).group_by_day(:created_at).count

  end

  def create
    @encounter = Encounter.new(encounter_params)
    # @encounter.includes([:user, :procedure]).where(user: current_user)
    @encounter.user_id = current_user.id
    @encounter.set_physician_fee

    respond_to do |format|
      if @encounter.save
        format.js
      end
    end
  end

  def destroy
    @encounter = Encounter.find(params[:id])
    @encounter.destroy
    respond_to do |format|
      format.js {render status: 200, json: {name: 'good job'}}
    end
  end

  def show
    @encounter = Encounter.find(params[:id])
  end

  def schedule
    if params[:date]
      date = Date.parse(params[:date])
      @encounters = current_user.encounters.includes(:user, :procedure).where(created_at: date.beginning_of_day..date.end_of_day)
    else
      @encounters = current_user.encounters.includes(:user, :procedure)
    end
  end

  protected
  def encounter_params
    params.require(:encounter).permit(:patient_name, :insurance_provider, :notes, :procedure_id).merge(user: current_user)
  end
end
