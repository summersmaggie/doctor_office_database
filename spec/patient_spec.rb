require("rspec")
require("pg")
require("patient")

DB = PG.connect({:dbname => 'doc_office_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM patients *;')
  end
end

describe(Patient) do
  describe("#==") do
      it("is the same person if it has the same name") do
        patient1 = Patient.new({:name => "Maggie"})
        patient2 = Patient.new({:name => "Maggie"})
        expect(patient1).to(eq(patient2))
      end
    end

  describe(".all") do
    it("is empty at first") do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a patient to an array of patients") do
      test_patient = Patient.new({:name => "Maggie", :birthdate => "1988-03-09", :doctor_id => 2})
      test_patient.save()
      expect(Patient.all()).to(eq([test_patient]))
    end
  end
end
