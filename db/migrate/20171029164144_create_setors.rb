class CreateSetors < ActiveRecord::Migration[5.1]
  def change
    create_table :setors, id: :uuid do |t|
      t.integer :codigo
      t.string :descricao
      t.string :permissao

      t.timestamps
    end
  end
end
