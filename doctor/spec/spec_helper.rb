require 'rspec'
require 'pg'
require 'doctor'
require 'patient'

DB = PG.connect(:dbname => 'doctor_office_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM patient *;")
    DB.exec("DELETE FROM doctor *;")
  end
end
