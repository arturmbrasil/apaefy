json.extract! doacao, :id, :valor, :forma_pagamento, :parceiro_id, :created_at, :updated_at
json.url doacao_url(doacao, format: :json)
