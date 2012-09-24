require "spec_helper"

describe "Admin" do
	before do
	  authorize 'admin', 'admin'
	end

  context "disciplines" do
    it "creates a new discipline" do
      post '/discipline', name: "Data Base"
      Discipline.where(name: "Data Base").should be_exists
    end

    it "removes a discipline" do
      new_discipline = Discipline.create(name: "Compilers")
      delete '/discipline', id: new_discipline.id
      Discipline.where(id: new_discipline.id).should_not be_exists
    end
  end

  context "teacher" do
    it "creates a new teacher" do
      post '/teacher', name: "John Deer"
      Teacher.where(name: "John Deer").should be_exists
    end

    it "removes a teacher" do
    	new_teacher = Teacher.create(name: "Bob Marley")
      delete '/teacher', id: new_teacher.id
      Teacher.where(id: new_teacher.id).should_not be_exists
    end
  end
end