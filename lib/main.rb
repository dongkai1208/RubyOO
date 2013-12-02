require_relative './parkinglot'
require_relative './person'
require_relative './car'
require_relative './receipt'

parkinglot= Parkinglot.instance(5)
car=Car.new('001')
#puts car.id
person= Person.new('Greg', car)
receipt= Receipt.new('R001')
person.park()
car2=Car.new('002')
person2=Person.new('zhang',car2)
receipt2=person2.park()
person.fetch(receipt)
person.fetch(receipt2)
person.fetch(receipt2)
