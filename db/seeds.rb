# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'net/http'
require 'json'

User.create({
  name: 'Admin',
  admin: true,
  gender: 'M',
  role: 'FIN',
  birthday: Date.today,
  document_rg: 123,
  document_cpf: 43748411804,
  document_cnh: 123,
  document_cns: 123,
  email: 'admin@admin.com',
  password: 'admin123'
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
