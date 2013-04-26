class PatientsController < ApplicationController
  before_filter :authenticate_therapist!

  def new
    @therapist = current_therapist
    @patient = @therapist.patients.build
    @patients = @therapist.patients
  end

  def create
    @therapist = current_therapist
    @patient = @therapist.patients.build(params[:patient])
    if @patient.save
      flash[:success] = "Patient created!"
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show
    @therapist = current_therapist
    @patient = @therapist.patients.find(params[:id]) 
  end
end
