class Std
	def initialize
		puts "Class Student"
	end
	def set_info(name,marks)
		@name=name
		@marks=marks
	end
	def disp
	 	puts "Display function in Class student."
	end
	def to_s
		"Student name-#{@name} \nMarks-#{@marks}"
	end
end
class Teach<Std
	def initialize
		puts "Class Teacher"
	end
	def info(name,age)
		@name=name
		@age=age
	end
	def to_s
	"Teacher name is #{@name} \nAge - #{@age}"
	end
end
obj1=Std.new
obj2=Teach.new
obj1.set_info("Rahul",98)
obj2.info("Shankar",48)
puts obj1
puts obj2
obj2.disp

