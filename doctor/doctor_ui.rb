require './lib/doctor.rb'
require './lib/patient.rb'
require 'pg'

DB = PG.connect({:dbname => 'doctor_office'})

def main_menu
  puts "Welcome to the Database\n\n"
  puts "Press 'd' to add, edit, list, or delete a doctor"
  puts "Press 'p' to add, edit, list, or delete a patient"
  puts "Press 'l' to link a doctor and patient"
  puts "Press 'x' to exit the program"
  choice = gets.chomp
  case choice
  when 'd' then doctor_menu
  when 'p' then patient_menu
  when 'l' then link
  when 'x' then puts "Goodbye!"
  else main_menu
  end
end

def patient_menu
  system('clear')
  puts "You've arrived at the Patient Menu\n\n"
  puts "Press 'a' to add a Patient"
  puts "Press 'l' to list all Patients"
  puts "Press 'e' to edit a Patient"
  puts "Press 'm' to return to main menu"
  choice = gets.chomp
  case choice
  when 'a' then add_patient
  when 'l' then list_patient
  when 'e' then edit_patient
  when 'm' then main_menu
  else puts "Please enter a valid choice"
    system('clear')
    patient_menu
  end
end

def add_patient
  system('clear')
  puts "Type in the Patient's Name"
  name = gets.chomp
  puts "Type in the Patient's Birthday"
  birthday = gets.chomp
  patient = Patient.new({'name' => name, 'birthday' => birthday})
  patient.save
  puts "Patient Added"
  system('clear')
  patient_menu
end

def list_patient
  system('clear')
  puts "Here is a list of all the patients"
  Patient.all.each do |patient|
    puts  "#{patient.id}. #{patient.name} * #{patient.birthday}\n\n"
  end
  main_menu
end

def doctor_menu
  system('clear')
  puts "You've arrived at the Doctor Menu\n\n"
  puts "Press 'a' to add a doctor"
  puts "Press 'l' to list all doctors"
  puts "Press 'e' to edit a doctor"
  puts "Press 'm' to return to main menu"
  choice = gets.chomp
  case choice
  when 'a' then add_doctor
  when 'l' then list_doctor
  when 'e' then edit_doctor
  when 'm' then main_menu
  else puts "Please enter a valid choice"
    system('clear')
    doctor_menu
  end
end

def add_doctor
  system('clear')
  puts "Type in the Doctor's Name"
  name = gets.chomp
  puts "Type in the Doctor's Specialty"
  specialty = gets.chomp
  doctor = Doctor.new({'name' => name, 'specialty' => specialty})
  doctor.save
  puts "Doctor Added"
  system('clear')
  doctor_menu
end

def list_doctor
  system('clear')
  puts "Here is a list of all the doctors"
  Doctor.all.each do |doctor|
    puts  "#{doctor.id}. #{doctor.name} - #{doctor.specialty}"
  end
  main_menu
end

def link
  system('clear')
  puts "Press the number of the doctor you want to add a patient to"
    Doctor.all.each do |doctor|
      puts  "#{doctor.id}. #{doctor.name} - #{doctor.specialty}"
    end
  puts "Press the number of the doctor you want to add a patient to"
  doctor_choice = gets.chomp

  puts "Press the number of the patient you want to add to above doctor"
    Patient.all.each do |patient|
      puts  "#{patient.id}. #{patient.name} * #{patient.birthday}\n\n"
    end
  puts "Press the number of the patient you want to add to above doctor"
  patient_choice = gets.chomp

  Doctor.combine
  puts "Doctor Patient Relationship Made"
  main_menu
end


main_menu




# def patient_menu
#   puts "To add a patient, press 'p'"
#   puts "To list all patients, press 'lp'"
#   puts "To edit a patient, press 'ep'"
