# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create({
  name: 'Admin',
  gender: 'M',
  role: 'FIN',
  birthday: Date.today,
  document_rg: 123,
  document_cpf: 123,
  document_cnh: 123,
  document_cns: 123,
  email: 'admin@admin.com',
  password: 'admin123'
});
