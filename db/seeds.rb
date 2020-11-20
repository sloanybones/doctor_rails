require 'faker'
doctors = []
patients = []
roles = ["emergency", "preventative", "check up"]


10.times do |i|
  doctors << Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end


50.times do |i|
  patients << Patient.create(name: Faker::Movies::HarryPotter.character)
end


patients.each do |patient|
  5.times do
    patient.appointments.create(role: roles.sample, doctor_id: doctors.sample.id)
  end
end
