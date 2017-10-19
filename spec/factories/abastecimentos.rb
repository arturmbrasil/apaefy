FactoryGirl.define do
  factory :abastecimento do
    combustivel "MyString"
    frota nil
    litros 1.5
    valor 1.5
    data_abastecimento "2017-10-19"
  end
end
