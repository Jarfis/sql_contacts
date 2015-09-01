class Contact
 
  attr_accessor :id, :fname, :lname, :email, :phoneorig, :phone, :address

  def initialize(id, fname, lname, email, phone, address)
    @id = id
    @fname = fname
    @lname = lname
    @email = email
    @phoneorig = phone
    @phone = {}
    if phone.include?(";")
      phone = phone.split(";")
    else
      phone = phone.split
    end
    
    phone.each do |i|
      @phone[i.split(":")[0]] ||=[]
      @phone[i.split(":")[0]].push(i.split(":")[1])
    end
    @address = address
  end
 
  def to_s
    temp = "ID:#{@id}\n   Name: #{@fname} #{@lname}\n   Email: #{@email}\n   Phone Number: \n"
#    return "ID:#{@id}\n   Name: #{@fname} #{@lname}\n   Email: #{@email}\n   Phone Number: 
#    puts "ID: #{@id}"
#    puts "   Name: #{@fname} #{@lname}"
#    puts "   Email: #{@email}"
#    puts "   Phone number: "
    @phone.each do |k,v|
      temp+= "     #{k.upcase}\n"
      v.each do |i|
        temp+= "%23s" % i +"\n"
      end
    end
    temp+= "   Address: #{@address}\n"
    return temp
  end
end
