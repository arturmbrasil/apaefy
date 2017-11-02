class CreateFrotas < ActiveRecord::Migration[5.1]
  def change
    create_table :frotas, id: :uuid do |t|
      t.string :nome
      t.string :veiculo
      t.string :placa
      t.integer :renavam, limit: 8
      t.string :chassi
      t.string :rota
      t.string :motorista
      t.string :roteirista

      t.timestamps
    end
  end
end
