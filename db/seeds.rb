require_relative '../models/house'
require_relative '../models/student'

house_data = [
  House.new({'name' => 'Slytherin', 'logo'=>'https://vignette.wikia.nocookie.net/harrypotter/images/d/d3/0.61_Slytherin_Crest_Transparent.png/revision/latest?cb=20161020182557'}),
  House.new({'name' => 'Gryffindor', 'logo'=>'https://vignette.wikia.nocookie.net/harrypotter/images/8/8e/0.31_Gryffindor_Crest_Transparent.png/revision/latest?cb=20161124074004'}),
  House.new({'name' => 'Ravenclaw', 'logo'=>'https://vignette.wikia.nocookie.net/harrypotter/images/2/29/0.41_Ravenclaw_Crest_Transparent.png/revision/latest?cb=20161020182442'}),
  House.new({'name' => 'Hufflepuff', 'logo'=>'https://vignette.wikia.nocookie.net/harrypotter/images/5/50/0.51_Hufflepuff_Crest_Transparent.png/revision/latest?cb=20161020182518'})
]

house_data.each{|house| house.save}

student_data = [
  {'first_name' => 'Harry', 'last_name' => 'Potter', 'house' => '2'},
  {'first_name' => 'Cho', 'last_name' => 'Chang', 'house' => '3'},
  {'first_name' => 'Lavender', 'last_name' => 'Brown', 'house' => '2'},
  {'first_name' => 'Cedric', 'last_name' => 'Diggory', 'house' => '4'},
  {'first_name' => 'Ron', 'last_name' => 'Weasley', 'house' => '2'},
  {'first_name' => 'Hermione', 'last_name' => 'Granger', 'house' => '2'},
  {'first_name' => 'Draco', 'last_name' => 'Malfoy', 'house' => '1'},
  {'first_name' => 'Milicent', 'last_name' => 'Bulstrode', 'house' => '1'},
  {'first_name' => 'Luna', 'last_name' => 'Lovegood', 'house' => '3'},
  {'first_name' => 'Ernie', 'last_name' => 'Macmillan', 'house' => '4'},
  {'first_name' => 'Dean', 'last_name' => 'Thomas', 'house' => '2'},
  {'first_name' => 'Padma', 'last_name' => 'Patil', 'house' => '3'},
  {'first_name' => 'Colin', 'last_name' => 'Creevey', 'house' => '2'},
]

students = student_data.map{|student| Student.new(student)}
students.each{|student| student.save}
