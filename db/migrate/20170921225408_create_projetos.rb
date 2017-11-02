class CreateProjetos < ActiveRecord::Migration[5.1]
  def change
    create_table :projetos, id: :uuid do |t|
      t.integer :codigo
      t.string :titulo
      t.text :descricao
      t.string :status
      t.text :metas
      t.float :valor

      t.timestamps
    end
  end
end
