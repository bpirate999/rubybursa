=begin

Создать класс Person, который можно проинициализировать таким образом:

person = Person.new('Oksana', '03-12-1991')

Конструктор принимает 2 параметра: name, birthday в формате, указанном выше. 
Для того, чтоб привести данную строку к дате, используем метод Date.parse(birthday).

Задание № 1. Написать метод age, который определяет возраст человека.

Задание № 2. Создать классы Woman и Man - наследники класса Person. Для каждого класса
определить среднюю продолжительность жизни в методе avg_life( Person: 68, Woman: 74, Man: 62).
Написать метод older_than_avg?, который возвращает true или false в зависимости от того, больше
ли возраст данного объекта чем средняя продолжительность жизни для этого класса.

person.older_than_avg?

Задание № 3. Написать метод can_marry?(person), который будет возвращать true или false в
зависимости от того, может ли данный человек вступить в брак с тем, который передается 
параметром. При этом:
 - мужчина может жениться с 18 лет
 - женщина может выйти замуж с 17 лет
 - однополые браки не разрешены
 - если один из брачующихся - объект класса Person, нужно raise TypeError

woman = Woman.new('Alina', '03-12-1990')
man   = Man.new('Ivan', '03-12-1985')
man.can_marry?(woman) #=> true
=end

require 'date'

class Person
 
def initialize(name, birthday)
      @name=name
      @birthday=Date.parse(birthday)
end

def age
      birthday = self.birthday.to_date
      now = Time.now.utc.to_date
      @age = now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
end

end



if __FILE__ == $0
    
    Human = Person.new
    Human.age
    
#   mg = MegaGreeter.new
#   mg.say_hi
#   mg.say_bye

#   # Change name to be "Zeke"
#   mg.names = "Zeke"
#   mg.say_hi
#   mg.say_bye

#   # Change the name to an array of names
#   mg.names = ["Albert", "Brenda", "Charles",
#     "Dave", "Engelbert"]
#   mg.say_hi
#   mg.say_bye

#   # Change to nil
#   mg.names = nil
#   mg.say_hi
#   mg.say_bye
end
