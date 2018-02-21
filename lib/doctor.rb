class Doctor
  attr_reader :name, :speciality, :id

  def initialize(attributes)
    @name = attributes[:name]
    @speciality = attributes[:speciality]
    @id = attributes[:id]
  end

  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      speciality = doctor.speciality("speciality")
      doctor.id("id").to_i()
      doctors.push(Patient.new({:name => name, :speciality => speciality, :id => id}))
    end
  doctors
end
end 
