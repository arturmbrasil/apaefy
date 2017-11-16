# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'net/http'
require 'json'

User.create!({
  name: 'Admin',
  admin: true,
  gender: 'M',
  role: 'DIR',
  birthday: Date.today - 40.years,
  document_rg: 911225341,
  document_cpf: 65158101728,
  document_cnh: 49136061077,
  document_cns: 60614913077,
  email: 'admin@admin.com',
  password: 'admin123'
});

User.create!({
  name: 'Mario',
  admin: false,
  gender: 'M',
  role: 'DRI',
  birthday: Date.today - 25.years,
  document_rg: 911225341,
  document_cpf: 65158101728,
  document_cnh: 49136061077,
  document_cns: 60614913077,
  email: 'mario@mario.com',
  password: 'mario123'
});

User.create!({
  name: 'Luciana',
  admin: false,
  gender: 'M',
  role: 'FIN',
  birthday: Date.today - 35.years,
  document_rg: 911225341,
  document_cpf: 65158101728,
  document_cnh: 49136061077,
  document_cns: 60614913077,
  email: 'luciana@luciana.com',
  password: 'luciana123'
});

url = 'https://gist.githubusercontent.com/letanure/3012978/raw/36fc21d9e2fc45c078e0e0e07cce3c81965db8f9/estados-cidades.json'
uri = URI(url)
response = Net::HTTP.get(uri)
results = JSON.parse(response)

results['estados'].each do |state|
  new_state = State.create!({
    name: state['nome'],
    acronym: state['sigla'],
  });

  state['cidades'].each do |city|
    new_state.cities.create!({
      name: city
    });
  end
end

santa_catarina = State.find_by(acronym: 'SC')
tubarao = santa_catarina.cities.find_by(name: 'Tubarão')
tubarao_addresses = [
  { address_street: 'Rua Júlio Boppré', address_number: '1260', address_neighborhood: 'Santo Antônio de Pádua', address_zip_code: '88701-511' },
  { address_street: 'Rua Augusto Severo', address_number: '318', address_neighborhood: 'Centro', address_zip_code: '88701-040' },
  { address_street: 'Av. Presidente Getúlio Vargas', address_number: '3384', address_neighborhood: 'Humaitá', address_zip_code: '88704-303' },
  { address_street: 'Rua Pedro Paulo Zarbanato', address_number: '131', address_neighborhood: 'São Martinho', address_zip_code: '88708-805' },
  { address_street: 'Rua Egídio Rigoni', address_number: '90', address_neighborhood: 'Centro', address_zip_code: '88701-630' },
  { address_street: 'Rua Rid Schneider', address_number: '284', address_neighborhood: 'Oficinas', address_zip_code: '88702-310' },
]

10.times do
  address = tubarao_addresses.sample
  Student.create!({
    name: Faker::StarWars.character,
    gender: User.genders.to_a.sample.first,
    birthday: Faker::Date.birthday(8, 25),
    city_id: tubarao.id,
    address_street: address[:address_street],
    address_number: address[:address_number],
    address_zip_code: address[:address_zip_code],
    address_neighborhood: address[:address_neighborhood],
  })
end

5.times do
  User.where(role: :driver).first.fleets.create!({
    name: Faker::StarWars.character,
    vehicle: 'Van',
    license_plate: 'ABC-0000',
    document_renavam: '0000000',
    chassis: Faker::Vehicle.vin,
    starting_address: 'Rua Lauro Muller, 3171 - Passagem, Tubarão - SC',
    destination_address: 'Rua Lauro Muller, 3171 - Passagem, Tubarão - SC',
    students: Student.offset(rand(Student.count)).limit(4)
  })
end
