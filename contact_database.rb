## TODO: Implement CSV reading/writing
require 'csv'
require "./contact"

class ContactDatabase

  attr_reader :thecontacts
  def initialize
    @thecontacts = {}
    holder = []
    File.open("contacts.csv","r").readlines.each do |theline|
      holder = theline.split(",")
   
      @thecontacts[holder[0]]=Contact.new(holder[0], holder[1], holder[2], holder[3], holder[4], holder[5].chomp)
    end
  end

  def print_all_contacts
    temp = ""
    @thecontacts.each do |k,v|
      temp+= v.to_s
    end
    return temp
  end

  def get_contact_by_id(theid)
    if @thecontacts[theid].to_s.length == 0
      return "Contact ID not found"
    else
      @thecontacts[theid].to_s
    end
  end

  def contact_already_exists?(theemail)
    @thecontacts.each do |k,v|
      puts v.email
      puts theemail
      if v.email == theemail
        return true
      end
    end
    return false
  end

  def search_for_contact(thesearch)
    temp = ""
    @thecontacts.each do |k,v|
      if v.fname.include?(thesearch) || v.lname.include?(thesearch) || v.email.include?(thesearch) || v.phone.include?(thesearch) || v.address.include?(thesearch)
        temp +=v.to_s
      end
    end
    temp
  end

  def insert_contact(fname, lname, email, phone, address)
    unless contact_already_exists?(email)
      newid = (@thecontacts.keys.sort.last.to_i+1).to_s
      @thecontacts[newid]=Contact.new(newid, fname, lname, email, phone, address)
      return newid
    else
      return "Email already exists"
    end
  end

  def save_database
    holder = File.open("contacts.csv","w")
    @thecontacts.each do |k,v|
      holder.puts "#{k},#{v.fname},#{v.lname},#{v.email},#{v.phoneorig},#{v.address}\n"
    end
    holder.close
  end
end
