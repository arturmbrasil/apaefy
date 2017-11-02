FactoryGirl.define do
  factory :conta_a_pagar do
    dt_vencimento "2017-10-15"
    nome "MyString"
    nr_nota 1
    valor 1.5
  end
end
