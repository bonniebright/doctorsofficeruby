require 'pg'

class Doctor

  attr_reader :name, :specialty, :id, :doctor_id, :patient_id, :doctor_choice, :patient_choice

  def initialize(attributes)
    @name = attributes['name']
    @specialty = attributes['specialty']
    @id = attributes['id']
    @doctor_id = attributes['doctor_id']
    @patient_id = attributes['patient_id']
    @doctor_choice = attributes['doctor_choice']
    @patient_choice = attributes['patient_choice']
  end

   def self.all
   results = DB.exec("SELECT * FROM doctor;")
   doctors = []
   results.each do |result|
     doctors << Doctor.new(result)
    end
   doctors
   end

  def self.combine
    DB.exec("INSERT INTO doc_and_patients (doctor_id, patient_id) VALUES (#{@doctor_id}, #{patient_choice}') RETURNING id;")

  end


  def ==(another_doctor)
    self.name == another_doctor.name
    self.specialty == another_doctor.specialty
  end

  def save
    DB.exec("INSERT INTO doctor (name, specialty) VALUES ('#{@name}', '#{@specialty}');")
  end
end

