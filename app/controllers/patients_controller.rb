class PatientsController < ApplicationController
  
  def index
  @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
   
  end

  def new
  @patient = Patient.new
  end

  def create
    
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to patient_path
    else
      render :new
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to patients_path
  end

private
    
  def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:name)
    end
end

