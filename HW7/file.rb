class Person
attr_accessor :name, :gender
def initialize(parameters)
@name = parameters[:name]
@gender = parameters[:gender]
end
 
end
 
class Actor < Person
@@all_actors = []
attr_accessor :age
 
def initialize(parameters)
@age = parameters[:age]
super
@@all_actors << self
end
 
def self.all_actors
@@all_actors
end
end
 
class Commission < Person
end
 
 
 
class Role
 
def initialize(parameters)
@theme = parameters[:theme]
@age_for_role = parameters[:age_for_role]
@sex = parameters[:sex]
end
def pretend
a = []
Actor.all_actors.each do |act|
if @age_for_role.include?(act.age) && act.gender == @sex || @sex == "all"
a.push(act.name)
end
end
return "applicant for role #{@theme}: #{a}"
end
end
 
class Action
def initialize(*presents)
presents.each do
end
def play
end 
ann = Actor.new({name: "Ann", age: 28, gender: "woman"})
alex = Actor.new({name: "Alex", age:30, gender: "man"}) # !> assigned but unused variable - egor
sasha = Actor.new({name: "Sasha", age:18, gender: "woman"}) # !> assigned but unused variable - masha
natasha = Actor.new({name: "Natasha", age:15, gender: "woman"}) # !> assigned but unused variable - dasha
 
lera = Commission.new({name: "lera", gender: "woman"}) # !> assigned but unused variable - lera
polina = Commission.new({name: "polina", gender: "woman"}) # !> assigned but unused variable - polina
sasha = Commission.new({name: "sashs", gender: "man"}) # !> assigned but unused variable - sasha
misha = Commission.new({name: "misha", gender: "man"}) # !> assigned but unused variable - misha
 
 
film1 = Role.new({theme: "love", age_for_role: 17..25, sex: "woman"})
film2 = Role.new({theme: "comedy", age_for_role: 12..25, sex: "man"})
film3 = Role.new({theme: "action", age_for_role: 15..25, sex: "man"})
film4 = Role.new({theme: "adult", age_for_role: 18..25, sex: "all"})
 
# {--метод .pretend - в классе Role--} #
film1.pretend # => "Претенденты на роль love: [\"masha\"]"
film2.pretend # => "Претенденты на роль comedy: [\"evs\", \"egor\"]"
film3.pretend # => "Претенденты на роль action: [\"evs\", \"egor\"]"
film4.pretend # => "Претенденты на роль adult: [\"evs\", \"egor\", \"masha\", \"dasha\"]"
 
evs_presents = Actions.new([{theme: "love", text: "text.txt"}]) # !> assigned but unused variable - evs_presents
egor_presents = Action.new([{theme: "action", text: "text.txt"}]) #=>длительность - кол-во символов тексте
 
# {--метод .play - в классе Action, первый аргумент - объект актёра--} #
# evs_presents.play(evs, [film1, film2, film3, film4])
#=> Актёр evs выступил перед комиссией на роли [film2, film3, film4]. На роль [film4] - нету текста
 
# egor_presents.play(egor, [film1, film2, film3, film4])
# masha_presents.play(masha, [film1, film2, film3, film4])
 
# --{метод .rate - в классе Action. фильмы берём из метода play, на которые был текст}-- #
# evs_presents.rate
# #=>Оцениваем актёра Evs на фильмы [film2, film3, film4]
# #=>masha -> lera: 1, polina: 5, sasha: 8, misha: 9; Средняя оценка: 5,75