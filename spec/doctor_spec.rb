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

  describe("#==") do
    it("is the same person if it has the same name") do
      doctor1 = Doctor.new({:name => "Dr. M", :speciality => "general medicine", :id => nil})
      doctor2 = Doctor.new({:name => "Dr. M", :speciality => "general medicine", :id => nil})
      expect(doctor1).to(eq(doctor2))
    end
  end
end
