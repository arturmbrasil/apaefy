json.extract! student, :id, :nome, :data_nascimento, :rg_aluno, :cpf_aluno, :telefone, :sexo, :responsavel_curador, :restricoes_alimentares, :rg_responsavel, :cpf_responsavel, :created_at, :updated_at
json.url student_url(student, format: :json)
