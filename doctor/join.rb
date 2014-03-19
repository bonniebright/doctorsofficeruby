require 'pg'

class Join

attr_reader :doctor_id, :patient_id

  def initialize(attributes)
    @doctor_id = attributes['doctor_id']
    @patient_id = attributes['patient_id']
  end

  def self.all

   #results = DB.exec("SELECT * FROM doctor INNER JOIN patient ON doctor.id = patient.id; ORDER BY doctor")
   joins = []
   results.each do |result|
      joins << Join.new(result)
    end
   joins
  end

  def ==(another_join)
    self.doctor_id == another_join.doctor_id
    self.patient_id == another_patient.birthday
  end

  def save
    DB.exec("INSERT INTO patient (name, birthday) VALUES ('#{@name}', '#{@birthday}');")
  end
end

