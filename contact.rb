require 'pg'

class Contact
 
  attr_accessor :fname, :lname, :email, :homephone, :cellphone, :address
  attr_reader :id

  def initialize(fname, lname, email, homephone, cellphone, address, id=nil)
    @id = id
    @fname = fname
    @lname = lname
    @email = email
    @homephone = homephone
    @cellphone = cellphone
    @address = address
  end

  def save
    unless in_db?
      qry = "INSERT INTO contacts (firstname, lastname, email, homephone, cellphone, address) values($1, $2, $3, $4, $5, $6) RETURNING id;"
    else
      qry = "UPDATE contacts SET firstname = $1, lastname = $2, email=$3, homephone=$4, cellphone=$5, address=$6 WHERE id=#{@id}"
    end

    tid = self.class.connection.exec_params(qry, [@fname, @lname, @email, @homephone, @cellphone, @address])

    puts tid.values[0]
  end

  def delete(id)
    qry = "DELETE FROM contacts WHERE id=$1"
    self.class.connection.exec_params(qry,[id])
  end

  def self.find(id)
    qry = "SELECT * FROM contacts WHERE id=$1"
    connection.exec_params(qry, [id]) do |r|
      result = r.values[0]

      Contact.new(result[1],result[2],result[3],result[4],result[5],result[6],result[0])
    end
  end

  def self.findbyfname(fname)
    qry = "SELECT * FROM contacts WHERE UPPER(firstname) = UPPER($1);"
    results = []
    connection.exec_params(qry, [fname]) do |r|
      r.values.each do |i|
        results << i
      end
    end
    results
  end

  def self.findbylname(lname)
    qry = "SELECT * FROM contacts WHERE UPPER(lastname) = UPPER($1);"
    results = []
    connection.exec_params(qry,[lname]) do |r|
      r.values.each do |i|
        results << i
      end
    end
    results
  end

  def self.findbyemail(email)
    qry = "SELECT * FROM contacts WHERE UPPER(lastname) = UPPER($1);"
    results = []
    connection.exec_params(qry,[lname]) do |r|
      r.values.each do |i|
        results << i
      end
    end
    results
  end

  def self.search(term)
    qry = "SELECT * FROM contacts WHERE UPPER(firstname) LIKE '%$1%' OR UPPER(lastname) LIKE '%$1%' OR UPPER(email) LIKE '%$1%' OR UPPER(address) LIKE '%$1%'"
    results = []
    connection.exec_params(qry,[term]) do |r|
      r.values.each do |i|
        results << i
      end
    end
    results
  end

  def to_s
     return "ID:#{@id}, Name: #{@fname} #{@lname} Email: #{@email} home numbers: #{@homephone} cell numbers: #{@cellphone} address: #{@addres}"
  end

  def self.connection
    PG.connect(host: 'localhost',dbname: 'contacts',user: 'joseph', password: 'joseph')
  end

  def in_db?
    return !@id.nil?
  end
end
