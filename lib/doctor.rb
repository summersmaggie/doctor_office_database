class Doctor
  attr_reader :name, :speciality, :id

  def initialize(attributes)
    @name = attributes[:name]
    @speciality = attributes[:speciality]
    @id = attributes[:id]
  end

  def self.all
    doctors = []
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      speciality = doctor.fetch("speciality")
      id = doctor.fetch("id").to_i()
      doctors.push(Doctor.new({:name => name, :speciality => speciality, :id => id}))
    end
    doctors
  end

  def save
    result = DB.exec("INSERT INTO doctors (name, speciality) VALUES ('#{@name}', '#{@speciality}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_doctor)
    self.name().==(another_doctor.name()).&(self.id().==(another_doctor.id()))
  end

  def self.find(id)
    found_doctor = nil
    Doctor.all().each() do |doctor|
      if doctor.id().==(id)
        found_doctor = doctor
      end
    end
    found_doctor
  end

  def patients
    list_patients = []
    patients = DB.exec("SELECT * FROM patients WHERE doctor_id = #{self.id()};")
    patients.each() do |patient|
      name = patient.fetch("name")
      birthdate = patient.fetch("birthdate")
      doctor_id = patient.fetch("doctor_id")
      id = patient.fetch("id").to_i
      list_patients.push(Patient.new({:name => name, :birthdate => birthdate, :doctor_id => doctor_id, :id => id}))
    end
    list_patients
  end
end
