require('pry-byebug')
require_relative('../models/student')
require_relative('../models/house')

Student.delete_all()
House.delete_all()

house1 = House.new({
  'name' => 'Gryffindor',
  'emblem' => 'https://shop.universalorlando.com/images/L_4HOUSES_Accessories_Patches_HarryPotter_Accessories_GryffindorCrestPatch_1230054.JPG'
  }
)

house2 = House.new({
  'name' => 'Slytherin',
  'emblem' => 'https://images-na.ssl-images-amazon.com/images/I/514NK21Jw0L._SY300_.jpg'
  }
)

house3 = House.new({
  'name' => 'Ravenclaw',
  'emblem' => 'https://images-na.ssl-images-amazon.com/images/I/91B7uDELZwL._SY450_.jpg'
  }
)

house4 = House.new({
  'name' => 'Hufflepuff',
  'emblem' => 'https://images-na.ssl-images-amazon.com/images/I/61nldEICKML._SY300_.jpg'
  }
)

house1.save()
house2.save()
house3.save()
house4.save()


student1 = Student.new({
  'first_name' => 'Harry',
  'second_name' => 'Potter',
  'house_id' => house1.id,
  'age' => '12'
  })

student2 = Student.new({
  'first_name' => 'Ron',
  'second_name' => 'Weasley',
  'house_id' => house1.id,
  'age' => '12'
  }
)

student3 = Student.new({
  'first_name' => 'Hermione',
  'second_name' => 'Granger',
  'house_id' => house1.id,
  'age' => '12'
  }
)

student4 = Student.new({
  'first_name' => 'Draco',
  'second_name' => 'Malfoy',
  'house_id' => house2.id,
  'age' => '13'
  }
)

student1.save()
student2.save()
student3.save()
student4.save()

binding.pry
nil
