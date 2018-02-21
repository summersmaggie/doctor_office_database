require("spec_helper")

describe(Doctor) do
  describe(".all") do
    it("is empty at first") do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves doctors to doctor array") do
      new_doctor = Doctor.new({:name => "Dr. M", :speciality => "general medicine", :id => nil})
      new_doctor.save()
      expect(Doctor.all()).to(eq([new_doctor]))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      doctor = Doctor.new({:name => "Dr. M", :speciality => "general medicine", :id => nil})
      doctor.save()
      expect(doctor.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("is the same person if it has the same name") do
      doctor1 = Doctor.new({:name => "Dr. M", :speciality => "general medicine", :id => nil})
      doctor2 = Doctor.new({:name => "Dr. M", :speciality => "general medicine", :id => nil})
      expect(doctor1).to(eq(doctor2))
    end
  end

  describe("#find") do
    it("returns a doctor by its id") do
      doctor1 = Doctor.new({:name => "Dr. M", :speciality => "general medicine", :id => nil})
      doctor1.save()
      doctor2 = Doctor.new({:name => "Dr. Q", :speciality => "general medicine", :id => nil})
      doctor2.save()
      expect(Doctor.find(doctor2.id())).to(eq(doctor2))
    end
  end

  describe("#patients") do
    it("returns an array of patients for that doctor") do
      new_doctor = Doctor.new({:name => "Dr. M", :speciality => "general medicine", :id => nil})
      new_doctor.save()
      new_patient_one = Patient.new({:name => "Maggie", :birthdate => "1988-03-09", :doctor_id => new_doctor.id(), :id => nil})
      new_patient_one.save()
      new_patient_two = Patient.new({:name => "Nugget", :birthdate => "2002-03-09", :doctor_id => new_doctor.id(), :id => nil})
      new_patient_two.save()
      expect(new_doctor.patients()).to(eq([new_patient_one, new_patient_two]))
    end
  end
end
