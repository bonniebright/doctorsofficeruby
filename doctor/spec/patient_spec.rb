require 'spec_helper'

describe Patient do
  describe 'initalize' do
  it ' is initialized with a name' do
    patient = Patient.new({'name' => 'Angela Hage', 'birthday' => '1988-03-17'})
    patient.should be_an_instance_of Patient
    end
  end

  it 'reveals the name of the class instance' do
    patient = Patient.new({'name' => 'Angela Hage', 'birthday' => '1988-03-17'})
    patient.name.should eq 'Angela Hage'
    patient.birthday.should eq '1988-03-17'
  end

  it 'starts off with no patients' do
    Patient.all.should eq []
  end

  it 'allows the user to save patients' do
    patient = Patient.new({'name' => 'Angela Hage', 'birthday' => '1988-03-17'})
    patient.save
    Patient.all.should eq [patient]
  end

  it 'has the same patient if it has the same properties' do
    patient1 = Patient.new({'name' => 'Angela Hage', 'birthday' => '1988-03-17'})
    patient2 = Patient.new({'name' => 'Angela Hage', 'birthday' => '1988-03-17'})
    patient1.should eq patient2
  end
end

