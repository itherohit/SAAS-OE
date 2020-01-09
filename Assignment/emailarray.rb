a=[]
while true
	puts"STRING ARRAY\n\t1.Add Email\n\t2.Display all\n\t3.Display only email ids\n\t4.Search\n\t5.Delete mail id by value\n\t6.Display Unique domain of all mail ids\n\t7.Count mail ids in given domain\n\t8.Exit"
	n=gets.chomp.to_i
	if(n==8)
		puts"Thank You"
		break
	end
	case n
		when 1
			puts"Enter the String"
			i=gets.chomp.to_s
			a.push(i)
			puts"String Added"
		when 2
			puts a
		when 3
			for i in 0..(a.length()-1)
				if a[i].include?('@')
					puts a[i]
				else
					next
				end
			end
		when 4
			puts"Enter a string to search"
			i=gets.chomp.to_s
			if a.include?(i)
				puts"The string is found in the index #{a.index(i)}"
			else
				puts"String Not Found"
			end
		when 5
			puts"Enter String to be deleted"
			i=gets.chomp.to_s
			if a.include?(i)
				a.delete(i)
				puts"String Deleted"
			else
				puts"String Not Found"
			end
		when 6
			domain=[]
			for i in 0..(a.length()-1)
				if a[i].include?('@')
					c=(a[i].index('@')+1).to_i
					if domain.include?(a[i][c,(a[i].length()-1)])
						next
					else
						domain.push(a[i][c,(a[i].length()-1)])
					end
				else
					next
				end
			end
			puts"\tDOMAINS"
			puts domain
		when 7
			count=0
			for i in 0..(a.length()-1)
				if a[i].include?('@')	
					count+=1
				else
					next
				end
			end
			puts "Emails found = #{count}"
		end
end

