json.extract! conta_a_pagar, :id, :dt_vencimento, :nome, :nr_nota, :valor, :created_at, :updated_at
json.url conta_a_pagar_url(conta_a_pagar, format: :json)
