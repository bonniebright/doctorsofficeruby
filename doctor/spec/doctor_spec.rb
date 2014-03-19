require 'spec_helper'

describe Doctor do
  it 'is initalized with a name' do
    doctor = Doctor.new({'name' => 'Doctor Jekyll', 'specialty' => 'Monster Troubles'})
    doctor.should be_an_instance_of Doctor
  end
  it 'reveals the name of the class instance' do
    doctor = Doctor.new({'name' => 'Doctor Jekyll', 'specialty' => 'Monster Troubles'})
    doctor.name.should eq 'Doctor Jekyll'
    doctor.specialty.should eq 'Monster Troubles'
  end

  it 'starts off with no doctors' do
    Doctor.all.should eq []
  end

  it 'allows the user to save doctors' do
    doctor = Doctor.new({'name' => 'Angela Hage', 'specialty' => 'Monster Troubles'})
    doctor.save
    Doctor.all.should eq [doctor]
  end

  it 'has the same doctor if it has the same properties' do
    doctor1 = Doctor.new({'name' => 'Angela Hage', 'specialty' => 'Monster Troubles'})
    doctor2 = Doctor.new({'name' => 'Angela Hage', 'specialty' => 'Monster Troubles'})
    doctor1.should eq doctor2
  end
  it 'will assign a patient to a doctor' do
    doctor_id = 4
    patient_id = 9
    Doctor.combine(doctor_id, patient_id)
    Doctor.combine.should eq [4,9]
  end
end

