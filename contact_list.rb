require_relative 'contact'
require_relative 'contact_database'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

#puts ContactDatabase.new.print_all_contacts

thedb=ContactDatabase.new

command = ARGV[0].downcase
if command == ("help")
  puts "Available commands: "
  puts "  new: Adds a new contact to the database"
  puts "  list: display all contacts"
  puts "  show: display a contact by id#"
  puts "  find: displays contacts that match the provided term"
elsif command == ("new")
  print "First name: "  
  fname = $stdin.gets.chomp
  print "Last name: "
  lname = $stdin.gets.chomp
  print "Email: "
  email = $stdin.gets.chomp
  command2=""
  phone = ""
  temp=[]
  loop do
    if command2=~/([A-z]+:\d{3}[\.\-\s]?\d{3}[\.\-\s]?\d{4})$/
      temp.push(command2)
    elsif command2=="done"
      phone=temp.join(";")
      break
    elsif command2.length>0
      puts "Please format yout input correctly"
    end
    print "Phone number (label:number, done to finish): "
    command2=$stdin.gets.chomp
  end
  print "Address: "
  address = $stdin.gets.chomp
  puts fname
  puts lname
puts email
puts phone
puts address
  puts thedb.insert_contact(fname, lname, email, phone, address)
elsif command == ("list")
  puts thedb.print_all_contacts
elsif command == ("show")
  puts thedb.get_contact_by_id(ARGV[1])
elsif command == ("find")
  puts thedb.search_for_contact(ARGV[1])
end

thedb.save_database
