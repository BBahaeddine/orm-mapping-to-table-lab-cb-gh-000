class Student
  attr_accessor :name, :grade, :id
  
  def initialize(name, grade)
    @name = name 
    @grade = grade
  end
  
  def self.create_table
    sql = <<-SQL 
    CREATE TABLE students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade TEXT
    );
    SQL
    DB[:conn].execute(sql)
  end
  
  
end
