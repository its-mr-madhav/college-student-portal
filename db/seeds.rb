# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Role.count == 0
  ['admin', 'hod', 'faculty', 'student'].each do |r|
    Role.create( name: r )
  end
end

role_id = Role.find_by(name: "admin").id

if User.count == 0
  u = User.create(
        name: "Portal Admin",
        email: "portaladmin@bbdit.com",
        phone: "9876543210",
        password: "password",
        password_confirmation: "password",
        role_id: role_id
      )
  u.confirm
end