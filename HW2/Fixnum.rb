=begin
В ruby мы имеем открытые классы. Это значит, что мы можем их расширять своими методами.

Задача: расширить класс Fixnum методом factorial, который будет возвращать факториал
заданного числа.

Примеры:
3.factorial #=> 6
0.factorial #=> 1
-5.factorial #=> nil
=end

class Fixnum
    def factorial
          return  1 if self.eql?(0)
          return  (1..self).inject(:*)  if self > 0
    end
end


puts 111.factorial
