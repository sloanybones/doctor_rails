class AppointmentsController < ApplicationController
  
  def index
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.new
    @prevents = @patient.appointments.where(role: "preventative")
    @checks = @patient.appointments.where(role: "check up")
    @emers = @patient.appointments.where(role: "emergency")
  end


def show
  end

def new
  @patient = Patient.find(params[:patient_id])
  # grab a list of users who are not enrolled in the course
  @appointment = appointment.new
end

def create
  @patient = Patient.find(params[:patient_id])
  @appointment = @patient.appointment.new(appointment_params)
  if @appointment.save
    redirect_to patient_appointments_path(@patient)
  else
    render :new
  end
end

def destroy
  @patient = Patient.find(params[:patient_id])
  @patient.appointments.find(params[:id]).destroy
  redirect_to patient_appointments_path(@patient)
end

private

def appointment_params
  params.require(:appointment).permit(:doctor_id, :role)
end
end
