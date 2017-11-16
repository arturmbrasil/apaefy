class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects, id: :uuid do |t|
      t.string :title, null: false, default: ''
      t.text :description, null: false, default: ''
      t.string :status, null: false, default: ''
      t.string :goals, null: false, default: ''
      t.float :value, null: false, default: ''
      t.references :user, foreign_key: true, index: true, type: :uuid

      t.timestamps
    end
  end
end
