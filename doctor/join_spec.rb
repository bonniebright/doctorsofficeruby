require 'spec_helper'

describe Join do
  it 'initializes the class Join and instances of the class' do
    new_join = Join.new(9,4)
    new_join.should be_an_instance_of Join
  end
    it 'reveals the name of the class instance' do
    join = Join.new({'doctor_id' => 9, 'patient_id' => 4})
    join.doctor_id.should eq 9
    join.patient_id.should eq 4
  end

  it 'starts off with no joins' do
    Join.all.should eq []
  end

  it 'allows the user to save joins' do
    join = Join.new({'doctor_id' => 9, 'patient_id' => 4})
    join.save
    Join.all.should eq [join]
  end

  it 'is the same join if it has the same properties' do
    join1 = Join.new({'doctor_id' => 9, 'patient_id' => 4})
    join2 = Join.new({'doctor_id' => 9, 'patient_id' => 4})
    join1.should eq join2
  end
end
