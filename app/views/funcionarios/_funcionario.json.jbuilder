json.extract! funcionario, :id, :codigo, :nome, :data_nascimento, :rg, :usuario, :senha, :sexo, :data_admissao, :created_at, :updated_at
json.url funcionario_url(funcionario, format: :json)
