class Student
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  attr_accessor :name, :grade
  attr_reader  :id

  def initialize (name, grade, id = nil)
    @name = name
    @grade = grade
    @id = id
  end

  def self.create_table
   sql =  <<-SQL
     CREATE TABLE students (
       id INTEGER PRIMARY KEY,
       name TEXT,
       grade TEXT
       )
       SQL
   DB[:conn].execute(sql)
   end
   
   def self.drop_table
     sql = <<-SQL
     DROP TABLE students 
     SQL
     DB[:conn].execute(sql)
   end 
   
  def save
     sql = <<-SQL
     INSERT INTO students(name, grade)
     VALUES (?, ?)
   SQL
 
   DB[:conn].execute(sql, self.name, self.grade)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]

 end 
 
 def self.create (name:, grade:)
#Create the songs table.
#Create two new song instances.
Use the song.save method to persist them to the database.

   student = Student.new(name, grade)
   student.save
   studuent 
 end

   
 end 


end
