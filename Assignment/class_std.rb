class Std
    def initialize(name,rollno,age,state,branch,cgpa)
        @name=name
        @rollno=rollno
        @age=age
        @state=state
        @branch=branch
        @cgpa=cgpa
    end
    def disp_name
        puts "\t"+@name.capitalize
    end
    def retbrch
        return @branch
    end 
    def retstate
        return @state
    end 
    def retroll
        return @rollno
    end
    def retname
        return @name
    end
end
a=[]
i=0

while true
    puts"STUDENT CLASS\n\t1.Add new student\n\t2.Display all Students\n\t3.Display all students by branch\n\t4.Display students by state\n\t5.Search Students by roll number\n\t6.Search by part of the name\n\t7.Delete by Roll number\n\t8.Count and Display number of students by state\n\t9.Count and Display number of students by branch\n\t10.Exit"
    n=gets.chomp.to_i
    if(n==10)
        puts "Thank You."
        break
    end
    case n
        when 1
            puts"\nEnter Students name, Rollno, Age, State, Branch, CGPA in the same order"
            name=gets.chomp.to_s
            roll=gets.chomp.to_i
            age=gets.chomp.to_i
            state=gets.chomp.to_s
            branch=gets.chomp.to_s
            cgpa=gets.chomp.to_f
            a[i]=Std.new(name,roll,age,state,branch,cgpa)
            i=a.size()
        when 2
            puts "\nStudent Name".upcase
            for j in 0..(i-1) do
                a[j].disp_name
            end
        when 3
            branch=[]
            for j in 0..(i-1) do
                brch=""
                if branch.include?(a[j].retbrch)
                    next
                else
                    branch.push(a[j].retbrch)
                    brch=a[j].retbrch
                end
                puts brch.upcase
                for k in 0..(i-1) do
                    if(a[k].retbrch==brch)
                        a[k].disp_name
                    else
                        next
                    end
                end    
            end        
        when 4
            statearr=[]
            for j in 0..(i-1) do
                state=""
                if statearr.include?(a[j].retstate)
                    next
                else
                    statearr.push(a[j].retstate)
                    state=a[j].retstate
                end
                puts state.upcase
                for k in 0..(i-1) do
                    if(a[k].retstate==state)
                        a[k].disp_name
                    else
                        next
                    end
                end    
            end
        when 5
            ver=1
            while ver==1
                puts "Enter Roll no."
                rollno=gets.chomp.to_i
                for j in 0..(i-1) do
                    if a[j].retroll==rollno
                        ver=0
                        puts "Students with Roll no. #{rollno} is"
                        a[j].disp_name
                    else
                        next
                    end 
                end
                if ver==1
                    puts"Student Not Found"
                end
            end    
        when 6
            ver=1
            while ver==1
                puts "Enter a string"
                nam=gets.chomp.to_s
                for j in 0..(i-1) do
                    if a[j].retname.include?(nam)
                        ver=0
                        a[j].disp_name
                    else
                        next
                    end 
                end
                if ver==1
                    puts"Student Not Found"
                end
            end
        when 7
            ver=1
            while ver==1
                puts "Enter Roll no to delete"
                roll=gets.chomp.to_i
                for j in 0..(i-1) do
                    if a[j].retroll==roll
                        ver=0
                        i=i-1
                        a.delete_at(j)
                        puts "Student with roll no #{roll} deleted"
                        break
                    else
                        next
                    end 
                end
                if ver==1
                    puts"Student Not Found"
                end
            end
        when 8
            puts "Students count by State".upcase
            statearr=[]
            for j in 0..(i-1) do
                state=""
                if statearr.include?(a[j].retstate)
                    next
                else
                    statearr.push(a[j].retstate)
                    state=a[j].retstate
                end
                count=0
                for k in 0..(i-1) do
                    if(a[k].retstate==state)
                        count+=1
                    else
                        next
                    end
                end  
                puts "\t#{state.capitalize} = #{count}"
            end
        when 9
            puts "Students count by branch".upcase
            branch=[]
            for j in 0..(i-1) do
                brch=""
                if branch.include?(a[j].retbrch)
                    next
                else
                    branch.push(a[j].retbrch)
                    brch=a[j].retbrch
                end
                count=0
                for k in 0..(i-1) do
                    if(a[k].retbrch==brch)
                        count+=1
                    else
                        next
                    end
                end    
                puts "\t#{brch.capitalize} = #{count}"
            end    
        end    
    end
        
        
