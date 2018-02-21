require('rspec')
require('pg')
require('patient')
require('doctor')

DB = PG.connect({:dbname = "office_database_test"})

Rspec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM patients *;")
  end
end
