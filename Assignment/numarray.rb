a=[]
while true
puts"NUMBER ARRAY\n\t1.Add Value\n\t2.Minimum\n\t3.Maximum\n\t4.Sum\n\t5.Average\n\t6.Search\n\t7.Display\n\t8.Delete Value by index\n\t9.Delete Value\n\t10.Exit"
n=gets.chomp.to_i
if(n==10)
puts"Thank You"
break
end
case n
when 1
puts"Enter a value"
i=gets.chomp.to_i
a.push(i)
when 2
puts"The Minimum value is #{a.min()}"
when 3
puts"The Maximum value is #{a.max()}"
when 4
puts"The Sum is #{a.sum()}"
when 5
puts"The Average is #{(a.sum())/(a.length())}"
when 6
puts"Enter a value to search"
i=gets.chomp.to_i
if a.index(i)
puts"The value is at the index #{a.index(i)}"
else
puts"There is no such value in the array"
end
when 7
puts"ARRAY"
puts a
when 8
puts"Enter a index to be deleted"
i=gets.chomp.to_i
if i>(a.size()-1)
puts"The index is not valid"
else
a.delete_at(i)
puts"Index Value Deleted"
end
when 9
puts"Enter a value to be deleted"
i=gets.chomp.to_i
if a.include?(i)
a.delete(i)
puts"Value Deleted"
else
puts"Value Not Found"
end
when 10
puts"Thank You"
break
end
end

