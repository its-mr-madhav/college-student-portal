# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.count.zero?
  u = User.create(
      name: 'Portal Admin',
      email: 'portaladmin@bbdit.com',
      phone: '9876543210',
      password: 'password',
      password_confirmation: 'password',
      role: 'admin'
    )
  u.confirm
end

if Department.count.zero?
  [['COMPUTER SCIENCE & ENGINEERING', 10], ['ELECTRONICS & COMMUNICATION ENGINEERING', 31], ['MECHANICAL ENGINEERING', 40], ['CIVIL ENGINEERING', 00], ['ELECTRICAL & ELECTRONICS ENGINEERING', 21], ['ELECTRONICS & COMMUNICATION ENGINEERING', 31]].each do |department|
    Department.create(
      name: department[0],
      code: department[1],
    )
  end
end

if Semester.count.zero?
  semesters = ['first', 'second', 'third', 'fourth', 'fifth', 'sixth', 'seventh', 'eighth']
  Department.all.each do |department|
    semesters.each do |semester|
      Semester.create( name: semester, department_id: department.id )
    end
  end
end
