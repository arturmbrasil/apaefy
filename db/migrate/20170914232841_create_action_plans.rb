class CreateActionPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :action_plans, id: :uuid do |t|
      t.date :data
      t.string :evolucao
      t.references :student, foreign_key: true, type: :uuid, index: true

      t.timestamps
    end
  end
end
