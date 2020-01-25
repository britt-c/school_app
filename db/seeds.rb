School.destroy_all

100.times do |i|
  school = School.create({
    name: "School #{i}",
    address: "123 Street",
    principal: "Mr. #{i}",
    capacity: ((i + 1) * 10 ),
    private_school: (rand(i) % 2 == 0)
  })

  i.times do |j|
    school.students.create({
      name: "Student #{i}#{j}",
      student_number: (i + j * 23),
      gpa: ( i * j + rand)
    })
  end
end

