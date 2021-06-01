class Employee

    attr_reader :salary

    def initialize(name, title, salary, boss=nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        @boss.employees << self if !@boss.nil?
    end

    def bonus(mult)
        @salary * mult
    end
end

class Manager < Employee

    attr_accessor :employees

    def initialize(name,title,salary,boss)
        super(name,title,salary,boss)
        @employees = []
    end

    def bonus(mult)
        mult * get_all_emp_salary(@employees)
    end

    def get_all_emp_salary(array)
        salary = 0
        array.each do |employee|
            if employee.is_a? Manager
                salary += employee.salary + get_all_emp_salary(employee.employees)
            else
                salary += employee.salary
            end
        end
        salary
    end
end

ned = Manager.new("Ned","Founder",1000000, nil)
darren = Manager.new("Darren","TA Manager",78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David","TA",10000, darren)

p ned.bonus(5)


