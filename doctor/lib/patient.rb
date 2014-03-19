require 'pg'

class Patient

attr_reader :name, :birthday, :id

  def initialize(attributes)
    @name = attributes['name']
    @birthday = attributes['birthday']
    @id = attributes['id']
  end

  def self.all
   results = DB.exec("SELECT * FROM patient;")
   patients = []
   results.each do |result|
      patients << Patient.new(result)
    end
   patients
  end

  def ==(another_patient)
    self.name == another_patient.name
    self.birthday == another_patient.birthday
  end

  def save
    DB.exec("INSERT INTO patient (name, birthday) VALUES ('#{@name}', '#{@birthday}');")
  end
end
