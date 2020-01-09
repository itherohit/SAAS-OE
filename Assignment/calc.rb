while true do
puts"CALCULATOR\n\t1.Addition\n\t2.Subtraction\n\t3.Multiplication\n\t4.Division\n\t5.Exit"
i=gets.chomp.to_i
if i==5
puts"Thankyou"
break
end
puts"Enter Two Digits:\n"
a=gets.chomp.to_i
b=gets.chomp.to_i
case i
when 1
	puts"Sum of #{a} and #{b} is #{a+b}"
when 2
	puts"Subtraction of #{a} and #{b} is #{a-b}"
when 3
	puts"Multiplication of #{a} and #{b} is #{a*b}"
when 4
	puts"Division of #{a} and #{b} is #{a/b}"
else
	puts"Invalid"
end
puts"Continue (y/n)?"
i=gets.chomp.to_s
if i=='y'or i=='Y'
next
else
puts"Thank you"
break
end
end

