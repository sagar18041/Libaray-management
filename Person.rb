require 'rubygems'
require 'pry'
class Person
	attr_accessor :name,:address,:phone_number
end

class Student < Person
	attr_accessor :roll_no,:section,:year
end

class Employee < Person
	attr_accessor :employee_id,:salary

end
=begin
	
rescue Exception => e
	
end
student=Student.new
employee=Employee.new
student.roll_no='18001'
student.section='MCA'
student.name='SAGAR'
student.address='sewri'
student.phone_number='1234512345'
student.year='3'
employee.name='rohinee'
employee.address='gav'
employee.phone_number='1234512345'
employee.employee_id='e001'
employee.salary='20000'
employee.display
binding.pry
=end