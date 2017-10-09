class Employee
  attr_reader :salary, :name, :title, :boss
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    #boss will be a method to add employee to manager's employee list
    @boss = boss
    add_self_to_boss

  end

  def add_self_to_boss
    @boss.add_employee(self) unless @boss.nil?
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
    bonus
  end
end

class Manager < Employee
  attr_reader :employees

  def initialize(name,title,salary,boss=nil)
    @employees = []
    super(name,title,salary,boss)
  end

  def add_employee(employee)
    @employees << employee

  end

  def bonus(multiplier)
    total_employee_salary = 0
    all_subs = all_subs_arr
    all_subs.each do |employee|
      total_employee_salary += employee.salary
    end
    bonus = total_employee_salary * multiplier
    bonus
  end

  def all_subs_arr
    r = []
    @employees.each do |employee|
      r << employee
      if employee.is_a?(Manager)
        r.concat(employee.all_subs_arr)
      end
    end
    r
  end

end


ned = Manager.new("Ned","Founder", 1000000)
darren = Manager.new("Darren","TA Manager", 78000, ned)
shawna = Employee.new("Shawna","TA", 12000, darren)
david = Employee.new("David","TA", 10000, darren)

puts ned.bonus(5) # => 500_000
puts darren.bonus(4) # => 88_000
puts david.bonus(3) # => 30_000
