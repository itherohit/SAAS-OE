def get_command_line_argument
    # ARGV is an array that Ruby defines for us,
    # which contains all the arguments we passed to it
    # when invoking the script from the command line.
    # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
    if ARGV.empty?
      puts "Usage: ruby lookup.rb <domain>"
      exit
    end
    ARGV.first
end
# `domain` contains the domain name we have to look up.
domain = get_command_line_argument

# File.readlines reads a file and returns an
# array of string, where each element is a line
# https://www.rubydoc.info/stdlib/core/IO:readlines
dns_raw = File.readlines("zone.txt")


#parse_dns returns a hash called dns_records containing two hashes recordA and recordCNAME
def parse_dns(dns_raw)
    dns=[]
    dns_records={}
    record_type_A=[]
    record_type_A_IP=[]
    record_type_CNAME=[]
    record_type_CNAME_destination=[]
    #adds each line to dns array and splipt them with ","
    dns_raw.each do |str|
        dns.push([str.split(',')])     
    end 
    
    #Checks for recordA,IP or recordCNAME and adds them to the respected array
    dns.each do |str|
        if str[0][0]=="A"
            record_type_A.push(str[0][1].strip)
            record_type_A_IP.push(str[0][2].strip)
        elsif str[0][0]=="CNAME"
            record_type_CNAME.push(str[0][1].strip)
            record_type_CNAME_destination.push(str[0][2].strip) 
        end
    end

    #record_A hash stores values of recordA
    record_A={
        :type => "A",
        :source => record_type_A,
        :destination => record_type_A_IP
    }

    #recordCNAME hash stores values of recordCNAME
    recordCNAME={
        :type => "CNAME",
        :source => record_type_CNAME,
        :destination => record_type_CNAME_destination 

    }

    #dns_records gets both Hashes     
    dns_records={
        :A => record_A,
        :CNAME => recordCNAME
    }
    
    #returns record dns_record with two hashes
    return dns_records
   
end

#this function adds domain details to lookup_chain
def resolve(dns_records, lookup_chain, domain)
    recordA=dns_records[:A]
    recordCNAME=dns_records[:CNAME]
    #if domain in recordA
    #add destination to lookup_chain
    if recordA[:source].include?(domain)
        lookup_chain.push(recordA[:destination][recordA[:source].index(domain)])
    #if domain in recordCNAME
    #add destination to lookup_chain
    #update domain with destination
    #call the funtion again with new domain(Recursion)
    elsif recordCNAME[:source].include?(domain)
        lookup_chain.push(recordCNAME[:destination][recordCNAME[:source].index(domain)])
        domain=recordCNAME[:destination][recordCNAME[:source].index(domain)]
        resolve(dns_records, lookup_chain, domain)
    else 
        return lookup_chain 
    end    
end
    
dns_records=parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
if lookup_chain.length()!=1
    puts lookup_chain.join('=>')
else    
    puts "ERROR : NOT FOUND"
end    
