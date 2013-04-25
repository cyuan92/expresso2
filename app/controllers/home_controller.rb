class HomeController < ApplicationController
  before_filter :authenticate_therapist!
  def new
    @therapist = current_therapist
    @patients = @therapist.patients
  end

  def show
    @therapist = current_therapist
    @patients = @therapist.patients
  end
end
