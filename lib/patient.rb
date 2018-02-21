class Patient
  attr_reader :name, :birthdate, :doctor_id

  def initialize(attributes)
    @name = attributes[:name]
    @birthdate = attributes[:birthdate]
    @doctor_id = attributes[:doctor_id]
  end

  def self.all
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each() do |patient|
      name = patient.fetch("name")
      birthdate = patient.fetch("birthdate")
      doctor_id = patient.fetch("doctor_id").to_i()
      patients.push(Patient.new({:name => name, :birthdate => birthdate, :doctor_id => doctor_id}))
      end
    patients
  end
end
