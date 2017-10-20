class CreateSpecialNeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :special_needs, id: :uuid do |t|
      t.string :descricao
      t.references :student, foreign_key: true, type: :uuid, index: true

      t.timestamps
    end
  end
end
