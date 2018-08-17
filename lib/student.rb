class Student
  attr_accessor :name, :grade
  attr_reader :id
  
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
  
  def self.drop_table
    sql = <<-SQL 
      DROP TABLE students;
    SQL
    DB[:conn].execute(sql)
  end
  
  def save(name, grade)
    sql = <<-SQL 
      INSERT INTO students(name, grade) VALUES (?, ?);
    SQL
    DB[:conn].execute(sql, name, grade)
  end
  
  def create(args)
    student = self.new(args[:name], args[:grade])
    student.save(student.name, student.grade)
    student
  end
  
end
